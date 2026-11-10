// MIT Licensed
// by Pysis(868)
// https://choosealicense.com/licenses/mit/

// MarkerListEntry
// - opts: [Object] Typical options object.
//   - onClick: [Function] The function to call when clicked.  Passes in the owned marker data object this entry represents.

function MarkerListEntry(marker, opts) {
  this._initSettings(marker, opts);
  this._initDOMElements(marker);
  var completionMarker = typeof zMap !== 'undefined' && zMap.cachedMarkersById && zMap.cachedMarkersById[marker.id] || marker;
  this.domNode.attr('data-list-marker-id', marker.id);
  if(!opts.completionCheckbox) {
    this.iconNode.append('<span class="area-marker-check" aria-label="Completed"><i class="fas fa-check" aria-hidden="true"></i></span>');
  }
  this.domNode.toggleClass('area-marker-completed', completionMarker.complete === true || completionMarker.complete == 1);
  if(opts.completionCheckbox) {
    var checkbox = $('<input type="checkbox" class="marker-list-completion" />')
      .attr('aria-label', 'Complete ' + (marker.title || marker.name))
      .prop('checked', completionMarker.complete === true || completionMarker.complete == 1)
      .on('mousedown', function(event) { event.preventDefault(); })
      .on('click', function(event) { event.stopPropagation(); })
      .on('change', function() {
        var input = this, requested = input.checked;
        input.checked = completionMarker.complete === true || completionMarker.complete == 1;
        input.disabled = true;
        zMap._setMarkerDone(marker.id, requested, function() {
          input.disabled = false;
          input.checked = completionMarker.complete === true || completionMarker.complete == 1;
        });
      });
    var completionControl = $('<label class="marker-list-completion-control"></label>')
      .on('click', function(event) { event.stopPropagation(); });
    completionControl.append(checkbox).append('<i class="fas fa-check" aria-hidden="true"></i>');
    this.domNode.prepend(completionControl);
  }
  this._setupUIInteraction(opts);
};

MarkerListEntry.prototype._initSettings = function(marker, opts) {
  this.marker = marker;
  this.categories = opts.categories;
};

MarkerListEntry.prototype._initDOMElements = function(marker) {
  this.domNode = $('' +
    '<li class="marker-list-entry">' +
      '<span class="icon">' +
      '</span>' +
      '<span class="details">' +
        '<div class="name">' +
          (marker.name || marker.title) +
        '</div>' +
        '<div class="description">' +
          marker.description +
        '</div>' +
      '</span>' +
    '</li>'
  );

  this.categoryIcon = new CategoryIcon(
    this.categories[(marker.categoryId || marker.markerCategoryId)]
  );
  this.iconNode = this.domNode.find('.icon');
  this.iconNode.append(this.categoryIcon.domNode);
};

MarkerListEntry.prototype._setupUIInteraction = function(opts) {
  this.domNode.on('click', opts.onClick.bind(this, this.marker));
};
