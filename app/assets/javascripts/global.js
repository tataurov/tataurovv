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
