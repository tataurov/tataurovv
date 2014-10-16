var
  $doc = $(document),
  $win = $(window),

  app = app || {config: {}, modules: {coreApplicationBase: {}, application: {}}};

Array.max = function( array ){
  return Math.max.apply( Math, array );
};

Array.min = function( array ){
  return Math.min.apply( Math, array );
};

isMobile = function() {
  return (
    (navigator.userAgent.match(/Android/i)) ||
      (navigator.userAgent.match(/webOS/i)) ||
      (navigator.userAgent.match(/iPhone/i)) ||
      (navigator.userAgent.match(/iPod/i)) ||
      (navigator.userAgent.match(/iPad/i)) ||
      (navigator.userAgent.match(/BlackBerry/))
    );
}
