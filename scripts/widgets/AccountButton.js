// AccountButton

function AccountButton(opts) {
  this._initDOMElements();
  this._setupUserInputListener(opts);
};

AccountButton.prototype._initDOMElements = function() {
  this.domNode = $('' +
    '<a class="button account-button full-icon-space" href="#account" style="outline: none;">' +
      '<i class="fas fa-user"></i>' +
    '</a>'
  );
};

AccountButton.prototype._setupUserInputListener = function(opts) {
  L.DomEvent.on(
    this.domNode[0],
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
