
function isMobile() {
  return (
    (navigator.userAgent.match(/Android/i)) ||
    (navigator.userAgent.match(/webOS/i)) ||
    (navigator.userAgent.match(/iPhone/i)) ||
    (navigator.userAgent.match(/iPod/i)) ||
    (navigator.userAgent.match(/iPad/i)) ||
    (navigator.userAgent.match(/BlackBerry/))
  );
}


$(document).ready(function(){
});

// Модуль работы с формами
app.modules.Global = (function(self) {
  var
    _addEvents = function() {


  },
  _init = function() {

    $("#home-banner h2").fitText(1.7, { minFontSize: '24px', maxFontSize: '64px' });
    var s = skrollr.init();
  };

  self.load = function() {
    _init();
    _addEvents();
  };
  return self;
}(app.modules.Global || {}));
