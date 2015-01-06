app.modules.Global = (function(self) {
  var
    _smoothScrolling = function() {
      $.srSmoothscroll();
    },

    _addEvents = function() {
      $doc.on('click', '.js-ajax-popup-link', function(e) {
        var $el = $(this);
        e.preventDefault();
        $.ajax({
          url: $el.attr('href'),
          success: function(data) {
           $(data).dialog({
             dialogClass: $el.data('popup-type'),
             modal: true,
             resizable: false,
             draggable: false
           });
           $doc.trigger($el.data('popup-type'));
          },
          error: function(e) {

          }
        });
      });
    },

    _init = function() {

      $("#home-banner h2").fitText(1.7, { minFontSize: '24px', maxFontSize: '64px' });

      if (!isMobile()) {
        self.Scrollr = skrollr.init({
          smoothScrolling: true,
          smoothScrollingDuration: 250
        });
        // _smoothScrolling();
      }
    };

  self.load = function() {
    _init();
    _addEvents();
  };
  return self;
}(app.modules.Global || {}));
