// Shared by category lists and region/path forms, even before Game Settings opens.
ZMap.prototype._canUseMapSettings = function() {
  var me = this.getUser();
  return !!me && me.level >= this.WIKI_EDITOR_LEVEL && !me.betaEditor;
};

ZMap.prototype._mapSettingsBadge = function(record) {
  var style = getPOIStyle(record);
  var span = $('<span class="icon-background circle category-icon map-settings-badge"></span>')
    .addClass('icon-' + (record.glyph || getPOIGlyph(record)));
  if(style) {
    span.addClass('poi-badge poi-' + style);
    if(String(record.container_id) === '22') span.addClass('poi-eow');
  } else {
    span.css({ 'background-color': record.color, 'border-color': record.color });
  }
  var vars = getPOIStyleVars(record);
  if(vars) span[0].style.cssText += vars;
  return span;
};

ZMap.prototype._mapSettingsField = function(label, icon, control) {
  return this._editorFieldHTML(icon, control, label);
};
