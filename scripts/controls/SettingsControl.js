L.Control.Settings = L.Control.extend({
  options: {
    position: 'topright'
  },

  initialize: function(options) {
    L.Util.setOptions(this, options);
    this.zMap = options.zMap;
    this.mapControl = options.mapControl;
    this.labelNames = [
      'Region Labels',
      'Area Labels',
      'Places Labels',
      'Places Labels - Close'
    ];
  },

  onAdd: function() {
    var container = L.DomUtil.create('div', 'settings-control leaflet-control');
    var toggle = L.DomUtil.create('button', 'settings-control-toggle', container);
    var panel = L.DomUtil.create('div', 'settings-control-panel', container);

    toggle.type = 'button';
    toggle.title = 'Map settings';
    toggle.setAttribute('aria-label', 'Map settings');
    toggle.setAttribute('aria-expanded', 'false');
    toggle.innerHTML = '<i class="fas fa-cog" aria-hidden="true"></i>';

    panel.setAttribute('aria-label', 'Map settings');
    panel.innerHTML = '<h3>Settings</h3>';

    this.container = container;
    this.toggleButton = toggle;
    this.panel = panel;

    L.DomEvent.disableClickPropagation(container);
    L.DomEvent.disableScrollPropagation(container);
    L.DomEvent.on(toggle, 'click', this.togglePanel, this);

    {
      this.minimalCheckbox = this.addCheckbox(
        'Minimal UI (esc)',
        this.mapControl.viewStyleBottomSlide ? !this.mapControl._open : this.mapControl.options.collapsed,
        function(checked) {
          this.setMinimalUI(checked);
        }
      );
      this.minimalCheckbox.parentNode.style.display = this.mapControl.isMobile ? 'none' : '';
      // The collapsed sidebar's logo button is the other way out of Minimal UI.
      L.DomEvent.on(this.mapControl._layersLink, 'click', function() {
        this.rememberMinimalUI(false);
      }, this);
    }

    this.hideCompletedCheckbox = this.addCheckbox('Hide Completed Markers', !this.zMap.mapOptions.showCompleted, function(checked) {
      this.setShowCompleted(!checked);
    });

    this.labelCategories = this.labelNames.map(function(name) {
      return this.findCategory(name);
    }, this).filter(Boolean);

    var savedPoiLabels = getCookie('showPoiLabels');
    this.zMap.mapOptions.showPoiLabels = savedPoiLabels === ''
      ? true
      : savedPoiLabels === 'true';

    // These read as "hide" in the panel; the saved settings stay "show".
    this.poiLabelsCheckbox = this.addCheckbox('Hide All Map Markers', !this.zMap.mapOptions.showPoiLabels, function(checked) {
      this.setPoiLabelsChecked(!checked);
    });

    this.regionAreaCheckbox = this.addCheckbox('Hide Region and Area Names', false, function(checked) {
      this.setRegionAreaNames(!checked);
    }, this.labelCategories.length === 0);

    // Region borders (BotW's and TotK's tower regions) are off unless turned
    // on, and only offered on games that have tower regions: area outlines
    // show only while their page is open.
    var hasRegions = this.zMap.maps.some(function(layer) {
      return this.zMap._layerRegions && this.zMap._layerRegions(layer).some(function(region) {
        return region.kind === 'tower';
      });
    }, this);
    if(hasRegions) {
      this.regionBordersCheckbox = this.addCheckbox('Show Region Borders', getCookie('showRegionBorders') === 'true', function(checked) {
        this.setRegionBorders(checked);
      });
      this.setRegionBorders(getCookie('showRegionBorders') === 'true', true);
    }

    // Counts show unless turned off.
    this.completionCountsCheckbox = this.addCheckbox(
      'Hide Completion Counts',
      !this.showsCompletionCounts(),
      function(checked) {
        this.setCompletionCounts(!checked);
      }
    );

    if(!this.mapControl.isMobile) {
      this.trackpadZoomCheckbox = this.addCheckbox('Trackpad: Two fingers zoom instead of pan', getCookie('trackpadTwoFingerZoom') === 'true', function(checked) {
        this.setTrackpadTwoFingerZoom(checked);
      });
    }

    this.hideReplacedCategoryButtons();
    var savedRegionAreaNames = getCookie('showRegionAreaNames');
    if(savedRegionAreaNames !== '') this.setRegionAreaNames(savedRegionAreaNames === 'true', true);
    this.syncRegionAreaNames();
    if(this.mapControl.isMobile) this.mountMobileControl(container, toggle, panel);
    return container;
  },

  mountMobileControl: function(container, toggle, panel) {
    L.DomUtil.addClass(container, 'settings-control-mobile-floating');
    this.panelHost = container;
  },

  addCheckbox: function(label, checked, onChange, disabled, child) {
    var row = L.DomUtil.create('label', 'settings-control-option' + (child ? ' child' : ''), this.panel);
    var input = L.DomUtil.create('input', null, row);
    var text = L.DomUtil.create('span', null, row);
    input.type = 'checkbox';
    input.checked = !!checked;
    input.disabled = !!disabled;
    text.textContent = label;
    L.DomEvent.on(input, 'change', function() {
      onChange.call(this, input.checked);
    }, this);
    return input;
  },

  findCategory: function(name) {
    return this.zMap.categoriesArr.find(function(category) {
      return category.name === name;
    });
  },

  setCategoryChecked: function(category, checked) {
    category.checked = checked;
    var button = this.mapControl._categoryMenu.categoryButtons.find(function(item) {
      return item.category.id == category.id;
    });
    if(button) button._toggle(checked);
    this.zMap.refreshMap(category);
    if(category.settingsCheckbox) category.settingsCheckbox.checked = checked;
  },

  // Each setter applies a setting, keeps its checkbox in step and saves it.
  // `skipSave` is for applying a value that is already saved.

  setShowCompleted: function(show, skipSave) {
    this.zMap.mapOptions.showCompleted = show;
    if(this.hideCompletedCheckbox) this.hideCompletedCheckbox.checked = !show;
    this.zMap.refreshMapCompleted();
    if(!skipSave) this.saveSetting('showCompleted', show);
  },

  setTrackpadTwoFingerZoom: function(checked, skipSave) {
    var handler = this.zMap.trackpadGestureHandler;
    if(handler) {
      handler.finishPinch();
      handler.zoomInsteadOfPan = checked;
    }
    if(this.trackpadZoomCheckbox) this.trackpadZoomCheckbox.checked = checked;
    if(!skipSave) this.saveSetting('trackpadTwoFingerZoom', checked);
  },

  setPoiLabelsChecked: function(checked, skipSave) {
    this.zMap.mapOptions.showPoiLabels = checked;
    this.zMap.refreshMap();
    if(this.poiLabelsCheckbox) this.poiLabelsCheckbox.checked = !checked;
    if(!skipSave) this.saveSetting('showPoiLabels', checked);
  },

  setRegionAreaNames: function(checked, skipSave) {
    this.labelCategories.forEach(function(category) {
      this.setCategoryChecked(category, checked);
    }, this);
    this.syncRegionAreaNames();
    if(!skipSave) this.saveSetting('showRegionAreaNames', checked);
  },

  setRegionBorders: function(checked, skipSave) {
    this.zMap.showRegionBorders = checked;
    if(this.regionBordersCheckbox) this.regionBordersCheckbox.checked = checked;
    if(this.zMap.updateRegionBorders) this.zMap.updateRegionBorders();
    if(!skipSave) this.saveSetting('showRegionBorders', checked);
  },

  showsCompletionCounts: function() {
    return getCookie('showCategoryCompletionCounts') !== 'false';
  },

  setCompletionCounts: function(checked, skipSave) {
    if(this.completionCountsCheckbox) this.completionCountsCheckbox.checked = !checked;
    setCookie('showCategoryCompletionCounts', checked);
    this.mapControl._categoryMenu.categoryButtons.forEach(function(button) {
      button.updateCategoryLabel();
    });
    if(!skipSave) this.saveSetting('showCategoryCompletionCounts', checked);
  },

  // Minimal UI hides the desktop sidebar until it is turned off here or with
  // the sidebar's logo button; selecting markers leaves it hidden.
  setMinimalUI: function(on, skipSave) {
    if(!this.mapControl.viewStyleBottomSlide) {
      // Hide without resetting the sidebar, so a selected marker stays put.
      if(on && !this.mapControl.options.collapsed) {
        this.mapControl.options.collapsed = true;
        this.mapControl.collapse();
      } else if(!on && this.mapControl.options.collapsed) {
        this.mapControl._expand();
      }
    }
    this.rememberMinimalUI(on, skipSave);
  },

  rememberMinimalUI: function(on, skipSave) {
    if(this.minimalCheckbox) this.minimalCheckbox.checked = on;
    if(!skipSave) this.saveSetting('minimalUI', on);
  },

  isMinimalUI: function() {
    return getCookie('minimalUI') === 'true';
  },

  // Restores Minimal UI on load, unless the link opens a page in the sidebar.
  applySavedMinimalUI: function() {
    if(this.isMinimalUI() && !getUrlParam('page')) this.setMinimalUI(true, true);
  },

  // Settings are kept in cookies on this device and, when signed in, on the
  // account (lib/common/user_settings.php).
  saveSetting: function(key, value) {
    setCookie(key, value);
    if(!this.zMap.getUser()) return;
    window.clearTimeout(this._accountSaveTimer);
    this._accountSaveTimer = window.setTimeout(this.saveAccountSettings.bind(this), 400);
  },

  currentSettings: function() {
    var settings = {
      showCompleted: this.zMap.mapOptions.showCompleted !== false,
      showPoiLabels: this.zMap.mapOptions.showPoiLabels !== false,
      showCategoryCompletionCounts: this.showsCompletionCounts(),
      minimalUI: this.isMinimalUI()
    };
    settings.trackpadTwoFingerZoom = !!(this.zMap.trackpadGestureHandler
      ? this.zMap.trackpadGestureHandler.zoomInsteadOfPan
      : getCookie('trackpadTwoFingerZoom') === 'true');
    var regionAreaNames = getCookie('showRegionAreaNames');
    if(regionAreaNames !== '') settings.showRegionAreaNames = regionAreaNames === 'true';
    var regionBorders = getCookie('showRegionBorders');
    if(regionBorders !== '') settings.showRegionBorders = regionBorders === 'true';
    return settings;
  },

  // done(saved) is optional. Changes that can't reach the server are sent
  // when the connection returns (ZOfflineSync).
  saveAccountSettings: function(done) {
    if(!this.zMap.getUser()) {
      if(done) done(false);
      return;
    }
    if(!navigator.onLine) {
      ZOfflineSync.setSettingsPending(true);
      if(done) done(false);
      return;
    }
    $.ajax({
      type: 'POST',
      url: 'ajax.php?command=save_user_settings',
      data: { settings: JSON.stringify(this.currentSettings()) },
      success: function(data) {
        if(data && data.success) ZOfflineSync.setSettingsPending(false);
        if(done) done(!!(data && data.success));
      },
      error: function(xhr) {
        if(ZOfflineSync.isNetworkError(xhr)) ZOfflineSync.setSettingsPending(true);
        if(done) done(false);
      }
    });
  },

  // On sign-in the account's settings replace this device's. An account with
  // none saved yet takes this device's instead.
  applyAccountSettings: function(settings) {
    // Changed offline since, so this device's are newer; they're sent with
    // the rest of the offline changes.
    if(ZOfflineSync.settingsPending()) return;
    if(!settings) {
      this.saveAccountSettings();
      return;
    }
    var apply = function(key, setter) {
      if(typeof settings[key] !== 'boolean') return;
      setCookie(key, settings[key]);
      setter.call(this, settings[key], true);
    }.bind(this);
    apply('showCompleted', function(value) {
      if(value !== (this.zMap.mapOptions.showCompleted !== false)) this.setShowCompleted(value, true);
    });
    apply('showPoiLabels', function(value) {
      if(value !== (this.zMap.mapOptions.showPoiLabels !== false)) this.setPoiLabelsChecked(value, true);
    });
    apply('showRegionAreaNames', this.setRegionAreaNames);
    apply('showCategoryCompletionCounts', this.setCompletionCounts);
    apply('showRegionBorders', this.setRegionBorders);
    apply('trackpadTwoFingerZoom', this.setTrackpadTwoFingerZoom);
    // Leave a page opened by the link (?page=account) showing.
    apply('minimalUI', function(value) {
      if(value && getUrlParam('page')) this.rememberMinimalUI(value, true);
      else this.setMinimalUI(value, true);
    });
  },

  syncRegionAreaNames: function() {
    var selected = this.labelCategories.filter(function(category) {
      return category.checked;
    }).length;
    if(this.regionAreaCheckbox) {
      this.regionAreaCheckbox.checked = selected === 0;
      this.regionAreaCheckbox.indeterminate = selected > 0 && selected < this.labelCategories.length;
      this.regionAreaCheckbox.disabled = this.labelCategories.length === 0;
    }
  },

  hideReplacedCategoryButtons: function() {
    var names = ['Labels'].concat(this.labelNames);
    this.mapControl._categoryMenu.categoryButtons.forEach(function(button) {
      if(names.indexOf(button.category.name) !== -1) {
        button.domNode.closest('li').addClass('settings-managed-category');
      }
    });
  },

  togglePanel: function() {
    var host = this.panelHost || this.container;
    var open = !L.DomUtil.hasClass(host, 'open');
    if(open) L.DomUtil.addClass(host, 'open');
    else L.DomUtil.removeClass(host, 'open');
    this.toggleButton.setAttribute('aria-expanded', String(open));
    if(open) {
      if(this.minimalCheckbox) {
        this.minimalCheckbox.checked = this.mapControl.viewStyleBottomSlide
          ? !this.mapControl._open
          : this.mapControl.options.collapsed;
      }
      this.syncRegionAreaNames();
    }
  }
});

L.control.settings = function(options) {
  return new L.Control.Settings(options);
};
