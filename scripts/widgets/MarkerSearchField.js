// MarkerSearchField
// - opts: [Object]
//   - minMatchCharLength: [Number] Minimum number of characters required before a search should be executed.  Too few for a lot of search material may cost heavily for performance.
//   - incrementalSearch: [Boolean] Search on any keypress or on Enter key press.
//   - showProgressBar: [Boolean] Whether the progress bar for the cremental search method or not.
//   - searchWaitCheckTimeThreshold: [Number] Amount of millisseconds to wait until a search is executed automatically for the incremental search method.
//   - updateProgressTotalStepsAmount: [Number] When showing the progess bar for the incremental search method, how granularly it should update.
//   - clearSearchFieldFirst: [Boolean] Whether actions like pressing the escape key will *only* clear a non-empty search query field.

function MarkerSearchField(opts) {
  this._initSettings(opts);
  this._initDOMElements();
  this._setupInputListeners();
};


MarkerSearchField.prototype._initDOMElements = function() {
  this.domNode = $('' +
    '<div class="form-group search-box">' +
      '<div class="icon-addon addon-sm">' +
        '<input type="text" placeholder="Ex: Oman Au Shrine" class="form-control marker-search" id="marker-search">' +
        '<a class="button icon-close2" href="javascript:;">×</a>' +
        '<label for="email" class="glyphicon glyphicon-search" rel="tooltip" title="email">' +
        '</label>' +
      '</div>' +
    '</div>'
  );

  this.searchInput = this.domNode.find('input.marker-search');
  this.clearSearchButton = this.domNode.find('.button.icon-close2');
  this.clearSearchButton.hide();

  if(this.incrementalSearch && this.showProgressBar) {
    this.progressBar = new ProgressBar();
    this.domNode.find('div.addon-sm').append(this.progressBar.domNode);
  }
};


MarkerSearchField.prototype._initSettings = function(opts) {
  this.incrementalSearch = getSetOrDefaultValue(opts.incrementalSearch, true); // False requires the enter key to be pressed to execute a search

  this.showProgressBar = getSetOrDefaultValue(opts.showProgressBar, true);
  // this.showSearchRequestIndicator = true; // Not yet implemented, changes the icon?, maybe implement as a separate widget, or pull into this one!!

  this.minMatchCharLength = getSetOrDefaultValue(opts.minMatchCharLength, 3);

  this.clearSearchFieldFirst = getSetOrDefaultValue(opts.clearSearchFieldFirst, true);

  this.searchWaitCheckTimeThreshold = getSetOrDefaultValue(opts.searchWaitCheckTimeThreshold, 0.5 * 1000); // 0.5s * 1000ms/s
  this.updateProgressTotalStepsAmount = getSetOrDefaultValue(opts.updateProgressTotalStepsAmount, 10);
  this.updateProgressStepAmount = 100 / this.updateProgressTotalStepsAmount;

  this.updateProgressIntervalTime = this.searchWaitCheckTimeThreshold / this.updateProgressTotalStepsAmount;

  this.searchTimerFunctionId;
  this.updateProgressIntervalFunctionId;
};


MarkerSearchField.prototype._setupInputListeners = function() {
  this.inputControl = $('#marker-search', this.domNode);

  if(this.incrementalSearch) this._addIncrementalSearchListener();

  this._addExplicitSearchListener();

  this._addClearSearchListeners();
};

MarkerSearchField.prototype._addIncrementalSearchListener = function() {
  this.inputControl.on("input", function (e) {
    this._clearIncrementalSearch();

    this._checkMinimumSearchCharactersSupplied(
      this._startSearchWait.bind(this)
    );
  }.bind(this));
};

MarkerSearchField.prototype._clearIncrementalSearch = function() {
  this._clearSearchWait();
  this._clearProgressBar();
};

MarkerSearchField.prototype._addExplicitSearchListener = function() {
  this.inputControl.on("keypress", function (e) {
    if(e.key == "Enter") {
      e.preventDefault();

      if(this.incrementalSearch) this._clearIncrementalSearch();
      this._checkMinimumSearchCharactersSupplied(
        this._executeSearch.bind(this)
      );
    }
  }.bind(this));
};

MarkerSearchField.prototype._addClearSearchListeners = function() {
  // https://stackoverflow.com/questions/3369593/how-to-detect-escape-key-press-with-pure-js-or-jquery
  // keypress didn't work =/
  this.inputControl.on("keydown", function(e) {
    if(e.key == "Escape") {
      if (this.clearSearchFieldFirst && this._getQuery()) e.stopPropagation();
      this.clear();
    }
  }.bind(this));

  this.clearSearchButton.on("click", this._clearSearchField.bind(this));

  this.inputControl.on("input", this._updateClearSearchButtonVisibility.bind(this));
};

MarkerSearchField.prototype.clear = function() {
  this._clearSearchField();
  this._clearIncrementalSearch();
};

MarkerSearchField.prototype._clearSearchField = function() {
  this._setQuery("");
  this._updateClearSearchButtonVisibility();
};


MarkerSearchField.prototype._updateClearSearchButtonVisibility = function() {
  if(!!this._getQuery() != this.clearSearchButton.is(":visible")) {
    this.clearSearchButton.toggle();
  }
};


MarkerSearchField.prototype._checkMinimumSearchCharactersSupplied = function(callback) {
  if(this._getQuery().length >= this.minMatchCharLength) {
    callback();
  }
};


MarkerSearchField.prototype._clearSearchWait = function() {
  if(this.searchTimerFunctionId) window.clearTimeout(this.searchTimerFunctionId);
};

MarkerSearchField.prototype._startSearchWait = function() {
  this._clearSearchWait();

  this.searchTimerFunctionId = window.setTimeout(
    this._executeSearch.bind(this),
    this.searchWaitCheckTimeThreshold
  );

  if(this.progressBar) this._startProgressBar();
};


MarkerSearchField.prototype._clearProgressBar = function() {
  if(this.progressBar) {
    if(this.updateProgressIntervalFunctionId) window.clearInterval(this.updateProgressIntervalFunctionId);
    this.progressBar.reset();
  }
};

MarkerSearchField.prototype._startProgressBar = function() {
  this._clearProgressBar();

  this.updateProgressIntervalFunctionId = window.setInterval(
    function() {
      this.progressBar.add(this.updateProgressStepAmount);
      if(this.progressBar.isComplete()) {
        window.clearInterval(this.updateProgressIntervalFunctionId);
        this.progressBar.reset();
      }
    }.bind(this),
    this.updateProgressIntervalTime
  );
};


MarkerSearchField.prototype._executeSearch = function() {
  this.domNode.trigger('search', this._getQuery());
};


MarkerSearchField.prototype._hasQuery = function () {
  return !!this.searchInput.val();
};

MarkerSearchField.prototype._getQuery = function () {
  return this.searchInput.val();
};

MarkerSearchField.prototype._setQuery = function (text) {
  return this.searchInput.val(text);
};


MarkerSearchField.prototype.focus = function () {
  return this.searchInput.focus();
};
