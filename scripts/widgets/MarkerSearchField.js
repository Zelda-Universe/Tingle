function MarkerSearchField(opts) {
  this._initSettings(opts);

  this._initDOMElements();

  this.setupUserInputListener();
};

MarkerSearchField.prototype._initDOMElements = function() {
  this.domNode = $(' \
    <div class="form-group search-box"> \
      <div class="icon-addon addon-sm"> \
        <input type="text" placeholder="Ex: Oman Au Shrine" class="form-control marker-search" id="marker-search"> \
        <label for="email" class="glyphicon glyphicon-search" rel="tooltip" title="email"> \
        </label> \
      </div> \
    </div> \
  ');

  if(this.showProgressBar) {
    this.progressBar = new ProgressBar();
    this.domNode.find('div.addon-sm').append(this.progressBar.domNode);
  }
};

MarkerSearchField.prototype._initSettings = function(opts) {
  this.showProgressBar = getSetOrDefaultValue(opts, "showProgressBar", true);
  // this.showSearchRequestIndicator = true; // Not yet implemented, changes the icon?, maybe implement as a separate widget, or pull into this one!!

  this.searchWaitCheckTimeThreshold = getSetOrDefaultValue(opts, "searchWaitCheckTimeThreshold", 0.5 * 1000); // 0.5s * 1000ms/s
  this.updateProgressTotalStepsAmount = getSetOrDefaultValue(opts, "updateProgressTotalStepsAmount", 10);
  this.updateProgressStepAmount = 100 / this.updateProgressTotalStepsAmount;

  this.updateProgressIntervalTime = this.searchWaitCheckTimeThreshold / this.updateProgressTotalStepsAmount;

  this.searchTimerFunctionId;
  this.updateProgressIntervalFunctionId;
};

MarkerSearchField.prototype.setupUserInputListener = function() {
  this.inputControl = $('#marker-search', this.domNode);

  this.inputControl.on("keyup", this.startSearchWait.bind(this));
};

MarkerSearchField.prototype.startSearchWait = function() {
  if(this.searchTimerFunctionId) window.clearTimeout(this.searchTimerFunctionId);

  this.searchTimerFunctionId = window.setTimeout(
    this.executeSearch,
    this.searchWaitCheckTimeThreshold
  );

  if(this.progressBar) this.startProgressBar();
};

MarkerSearchField.prototype.startProgressBar = function() {
  if(this.updateProgressIntervalFunctionId) window.clearInterval(this.updateProgressIntervalFunctionId);
  this.progressBar.reset();

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

MarkerSearchField.prototype.executeSearch = function() {
  console.log("Search!"); // TODO: Add code to request and/or start utilizing data, or even just emit an event on this object and make another widget to listen and to this job.
};
