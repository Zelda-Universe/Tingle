// ProgressBar
// - opts: [Object]
//   - progressPercentage: [Number] Starting amonut out of 100 that the progress bar should be filled.

function ProgressBar(opts) {
  opts = opts || {};

  this._initDOMElements();
  this._initState(opts);
};

ProgressBar.prototype._initDOMElements = function() {
  this.domNode = $(' \
    <div class="progress-bar-container"> \
      <div class="progress-bar-filler"></div> \
    </div> \
  ');

  this.progressElement = this.domNode.find('.progress-bar-filler');
};

ProgressBar.prototype._initState = function(opts) {
  this.set(getSetOrDefaultValue(opts.progressPercentage, 0));
};

ProgressBar.prototype._updateState = function() {
  this.progressElement.css("width", this.progressPercentage + '%');
};

ProgressBar.prototype.add = function(additionalProgressPercentage) {
  this.set(this.progressPercentage + additionalProgressPercentage);
};

ProgressBar.prototype.set = function(progressPercentage) {
  this.progressPercentage = progressPercentage || 0;

  this._updateState();
};

ProgressBar.prototype.isComplete = function() {
  return this.progressPercentage > 100;
};

ProgressBar.prototype.reset = function() {
  this.set(0);
};
