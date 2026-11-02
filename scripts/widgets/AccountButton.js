// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// AccountButton

function AccountButton(opts) {
  this._initDOMElements();
  this._setupUserInputListener(opts);
  this.updateUser(user);
};

AccountButton.prototype._initDOMElements = function() {
  this.domNode = $('' +
    '<a class="button account-button full-icon-space" style="outline: none;">' +
      '<span class="account-button-icon"><i class="fas fa-user"></i></span>' +
    '</a>'
  );
};

AccountButton.prototype.updateUser = function(currentUser) {
  var iconContainer = this.domNode.find('.account-button-icon');
  if(currentUser) {
    var profilePicture = currentUser.profilePicture || 'images/default-avatar.svg';
    iconContainer.html(
      $('<img>', {
        alt: currentUser.username + "'s profile picture",
        class: 'account-profile-picture',
        src: profilePicture
      })
    );
    this.domNode.addClass('has-profile-picture');
  } else {
    iconContainer.html('<i class="fas fa-user"></i>');
    this.domNode.removeClass('has-profile-picture');
  }
};

AccountButton.prototype._setupUserInputListener = function(opts) {
  L.DomEvent.on(
    this.domNode[0],
    'click',
    this.click.bind(this, opts)
  );

  opts.mapControl.addHandler("afterSetContent", function(vContent, vType) {
    $(this.domNode).parent().toggleClass("highlighted", ["loginForm", "accountPage", "offlineMapsPage"].includes(vType));
  }.bind(this));

  zMap.addHandler('userChanged', this.updateUser.bind(this));
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
