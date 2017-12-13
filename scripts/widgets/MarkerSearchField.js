// MarkerSearchField
// - opts: [Object]
//   - minMatchCharLength: [Number] Minimum number of characters required before a search should be executed.  Too few for a lot of search material may cost heavily for performance.
//   - incrementalSearch: [Boolean] Search on any keypress or on Enter key press.
//   - showProgressBar: [Boolean] Whether the progress bar for the cremental search method or not.
//   - searchWaitCheckTimeThreshold: [Number] Amount of millisseconds to wait until a search is executed automatically for the incremental search method.
//   - updateProgressTotalStepsAmount: [Number] When showing the progess bar for the incremental search method, how granularly it should update.

function MarkerSearchField(opts) {
  this._initSettings(opts);
  this._initDOMElements();
  this._setupUserInputListener();
};

MarkerSearchField.prototype._initDOMElements = function() {
  this.domNode = $('' +
    '<div class="form-group search-box">' +
      '<div class="icon-addon addon-sm">' +
        '<input type="text" placeholder="Ex: Oman Au Shrine" class="form-control marker-search" id="marker-search">' +
        '<label for="email" class="glyphicon glyphicon-search" rel="tooltip" title="email">' +
        '</label>' +
      '</div>' +
    '</div>'
  );

  this.searchInput = this.domNode.find('input.marker-search');

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

  this.searchWaitCheckTimeThreshold = getSetOrDefaultValue(opts.searchWaitCheckTimeThreshold, 0.5 * 1000); // 0.5s * 1000ms/s
  this.updateProgressTotalStepsAmount = getSetOrDefaultValue(opts.updateProgressTotalStepsAmount, 10);
  this.updateProgressStepAmount = 100 / this.updateProgressTotalStepsAmount;

  this.updateProgressIntervalTime = this.searchWaitCheckTimeThreshold / this.updateProgressTotalStepsAmount;

  this.searchTimerFunctionId;
  this.updateProgressIntervalFunctionId;
};

MarkerSearchField.prototype._setupUserInputListener = function() {
  this.inputControl = $('#marker-search', this.domNode);

  if(this.incrementalSearch) {
    this.inputControl.on("input", function (e) {
      this._clearSearchWait();
      this._clearProgressBar();
      this._checkMinimumSearchCharactersSupplied(
        this._startSearchWait.bind(this)
      );
    }.bind(this));
  } else {
    this.inputControl.on("keypress", function (e) {
      if(e.key == "Enter") {
        e.preventDefault();
        this._checkMinimumSearchCharactersSupplied(
          this._executeSearch.bind(this)
        );
      }
    }.bind(this));
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
  this.domNode.trigger('search', { query: this._getQuery() });
};

MarkerSearchField.prototype._getQuery = function () {
  return this.searchInput.val();
}
