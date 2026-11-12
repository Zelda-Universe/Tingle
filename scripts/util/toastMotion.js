// Toastr's lifecycle callbacks, with the Completes reminder's CSS motion.
// Its separate A/B-test banner/dialog never passes through these methods.
(function($) {
  function cancelTimer(element) {
    window.clearTimeout(element._zmapToastTimer);
    element._zmapToastTimer=null;
  }
  function finishAfter(element, options, fallback, complete) {
    var reduced=window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    var duration=reduced ? 0 : (typeof options.duration==='number' ? options.duration : fallback);
    element._zmapToastTimer=window.setTimeout(function() {
      element._zmapToastTimer=null;
      complete();
      if(typeof options.complete==='function') options.complete.call(element);
    },duration);
  }
  $.fn.zmapToastIn=function(options) {
    options=options || {};
    return this.each(function() {
      var element=this,toast=$(element),alreadyVisible=element.style.display!=='none';
      cancelTimer(element);
      toast.removeClass('is-closing').show();
      // Hovering an existing toast cancels its exit, without replaying entry.
      if(alreadyVisible) {if(options.complete) options.complete.call(element);return;}
      toast.addClass('is-entering');
      finishAfter(element,options,300,function() {toast.removeClass('is-entering');});
    });
  };
  $.fn.zmapToastOut=function(options) {
    options=options || {};
    return this.each(function() {
      var element=this,toast=$(element);
      cancelTimer(element);
      toast.removeClass('is-entering').addClass('is-closing');
      finishAfter(element,options,250,function() {toast.hide().removeClass('is-closing');});
    });
  };
})(jQuery);
