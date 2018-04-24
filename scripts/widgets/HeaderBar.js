// Header
// - opts: [Object]
//   - parent: [DOMElement] The parent node to attach to.
//   - mapControl: [Object] The drawer menu that will render the list of searched markers.
//   - loginButton: [Boolean] Whether to show this control or not.
//   - largerSearchArea: [Boolean] Whether to show
//   - shrinkButton: [Boolean] Whether to show this control or not.

function HeaderBar(opts) {
  opts = opts || {};

  this._initSettings(opts);
  this._initDOMElements(opts);
};

HeaderBar.prototype._initSettings = function(opts) {
  this.parent = opts.parent;

  // Currently unused, but could be effective.
  // TODO: Would be more awesome if this worked if the ordering for fetching
  // potential user info came earlier since it is depended on by more
  // component code locations, rather than creating the form now and hiding
  // it later on, but hey
  this.loginButton = getSetOrDefaultValue(opts.loginButton, !zMap.getUser());
  this.largerSearchArea = getSetOrDefaultValue(opts.largerSearchArea, !this.loginButton);

  this.shrinkButton = opts.shrinkButton;

  this.mapControl = opts.mapControl;
};

HeaderBar.prototype._initDOMElements = function() {
  var headerDiv = L.DomUtil.create('div', 'row vertical-divider row-header', this.parent);

  if(this.loginButton) {
    var headerDivLeft = L.DomUtil.create('div', 'col-xs-2 full-icon-space-container', headerDiv);
    this.createLoginButton(headerDivLeft);
  }

  var headerDivMid = L.DomUtil.create(
    'div',
    (
      (this.loginButton && this.shrinkButton)
      ? 'col-xs-8'
      : (
          (this.loginButton || this.shrinkButton)
          ? 'col-xs-10'
          : 'col-xs-12'
        )
    ),
    headerDiv
  );
  this.createSearchArea(headerDivMid);

  if(this.shrinkButton) {
    var headerDivRight = L.DomUtil.create('div', 'col-xs-2 full-icon-space-container', headerDiv);
    this.createShrinkButton(headerDivRight);
  }
};

HeaderBar.prototype.createActionsButton = function(parent) {
  var barsButton = L.DomUtil.create('a', 'button icon-bars full-icon-space', parent);
  barsButton.innerHTML = '';
  barsButton.href = "#close";
  L.DomEvent
    .on(barsButton, 'click', L.DomEvent.stopPropagation)
    .on(barsButton, 'click', function(e) {
      // Open
      this._collapse();
      _this._closeNewMarker();
      e.preventDefault();
    }, mapControl)
  ;
};

HeaderBar.prototype.createLoginButton = function(parent) {
  var loginButton = L.DomUtil.create('a', 'button icon-fa-user login-button full-icon-space', parent);
  loginButton.href = "#login";

  L.DomEvent.on(
    loginButton,
    'click',
    this.mapControl.toggleContent.bind(
      this.mapControl,
      "loginForm",
      zMap._createLoginForm.bind(zMap)
    )
  );

  this.mapControl.addHandler("afterSetContent", function(vContent, vType) {
    $(parent).toggleClass("highlighted", (vType == "loginForm"));
  });
};

HeaderBar.prototype.createSearchArea = function(parent) {
  this.searchArea = new SearchArea({
    parent: parent,
    markerListViewBuiltHandler: function(markerListView) {
      this.mapControl.setContent(markerListView.domNode, 'search');
    }.bind(this)
  });
};

HeaderBar.prototype.createShrinkButton = function(parent) {
  var shrinkButton = L.DomUtil.create('a', 'button icon-shrink full-icon-space', parent);
  shrinkButton.innerHTML = '';
  shrinkButton.href = "#close";
  L.DomEvent
    .on(shrinkButton, 'click', L.DomEvent.stopPropagation)
    .on(shrinkButton, 'click', function(e) {
      // Open
      this._collapse();
      _this._closeNewMarker();
      e.preventDefault();
    }, mapControl);
};

HeaderBar.prototype.focus = function() {
  this.searchArea.focus();
};
