app.modules.Global = (function(self) {
  var
    _smoothScrolling = function() {
      $.srSmoothscroll({
        step: 30,
        speed: 100
      });
    },

    _addEvents = function() {


    },
    _init = function() {

      $("#home-banner h2").fitText(1.7, { minFontSize: '24px', maxFontSize: '64px' });

      self.Scrollr = skrollr.init({
        smoothScrolling: true,
        smoothScrollingDuration: 250
      });
      if (!isMobile()) {
        _smoothScrolling();
      }
    };
  self.load = function() {
    _init();
    _addEvents();
  };
  return self;
}(app.modules.Global || {}));
