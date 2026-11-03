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

    this.addCheckbox('Hide Completed Markers', !this.zMap.mapOptions.showCompleted, function(checked) {
      this.zMap.mapOptions.showCompleted = !checked;
      setCookie('showCompleted', !checked);
      this.zMap.refreshMapCompleted();
    });

    {
      this.minimalCheckbox = this.addCheckbox(
        'Minimal UI',
        this.mapControl.viewStyleBottomSlide ? !this.mapControl._open : this.mapControl.options.collapsed,
        function(checked) {
          if(this.mapControl.viewStyleBottomSlide) {
            if(checked) this.mapControl.closeDrawer();
            else this.mapControl.openDrawerLarge();
          } else if(checked) {
            this.mapControl._collapse();
          } else {
            this.mapControl._expand();
          }
        }
      );
      this.minimalCheckbox.parentNode.style.display = this.mapControl.isMobile ? 'none' : '';
    }

    this.labelCategories = this.labelNames.map(function(name) {
      return this.findCategory(name);
    }, this).filter(Boolean);

    var savedPoiLabels = getCookie('showPoiLabels');
    this.zMap.mapOptions.showPoiLabels = savedPoiLabels === ''
      ? true
      : savedPoiLabels === 'true';

    this.poiLabelsCheckbox = this.addCheckbox('Show POI Markers', this.zMap.mapOptions.showPoiLabels, function(checked) {
      this.setPoiLabelsChecked(checked);
    });

    this.regionAreaCheckbox = this.addCheckbox('Show Region and Area Names', false, function(checked) {
      this.labelCategories.forEach(function(category) {
        this.setCategoryChecked(category, checked);
      }, this);
      this.syncRegionAreaNames();
    }, this.labelCategories.length === 0);

    this.hideReplacedCategoryButtons();
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

  setPoiLabelsChecked: function(checked) {
    this.zMap.mapOptions.showPoiLabels = checked;
    setCookie('showPoiLabels', checked);
    this.zMap.refreshMap();
    if(this.poiLabelsCheckbox) this.poiLabelsCheckbox.checked = checked;
  },

  syncRegionAreaNames: function() {
    var selected = this.labelCategories.filter(function(category) {
      return category.checked;
    }).length;
    if(this.regionAreaCheckbox) {
      this.regionAreaCheckbox.checked = selected > 0 && selected === this.labelCategories.length;
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
