// AccountButton

function AccountButton(opts) {
  this._initDOMElements();
  this._setupUserInputListener(opts);
};

AccountButton.prototype._initDOMElements = function() {
  this.domNode = L.DomUtil.create('a', 'button icon-fa-user account-button full-icon-space');
  this.domNode.href = "#account";
};

AccountButton.prototype._setupUserInputListener = function(opts) {
  L.DomEvent.on(
    this.domNode,
    'click',
    this.click.bind(this, opts)
  );

  opts.mapControl.addHandler("afterSetContent", function(vContent, vType) {
    $(this.domNode).parent().toggleClass("highlighted", ["loginForm", "accountPage"].includes(vType));
  }.bind(this));
};

AccountButton.prototype.click = function(opts) {
  if(user) {
    opts.mapControl.toggleContent(
      "accountPage",
      zMap._createAccountForm.bind(zMap, user)
    )
  } else {
    opts.mapControl.toggleContent(
      "loginForm",
      zMap._createLoginForm.bind(zMap)
    )
  }
};
