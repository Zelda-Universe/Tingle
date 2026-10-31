// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// AccountButton

function AccountButton(opts) {
  this._initDOMElements();
  this._setupUserInputListener(opts);
};

AccountButton.prototype._initDOMElements = function() {
  this.domNode = $('' +
    '<a class="button account-button full-icon-space" style="outline: none;">' +
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
  var contentType;
  var setContent;

  if(user) {
    contentType = "accountPage";
    setContent = zMap._createAccountForm.bind(zMap, user);
  } else {
    contentType = "loginForm";
    setContent = zMap._createLoginForm.bind(zMap);
  }

  if(opts.mapControl.isMobile) {
    if(opts.mapControl._open && opts.mapControl._contentType === contentType) {
      opts.mapControl.closeDrawer();
      return;
    }

    if(opts.mapControl._contentType !== contentType) {
      setContent();
    }
    opts.mapControl.openDrawerLarge();
  } else {
    opts.mapControl.toggleContent(
      contentType,
      setContent
    );
  }
};
