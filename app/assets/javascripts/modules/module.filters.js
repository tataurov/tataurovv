app.modules.filter = (function(self) {
  var
    _worksModule,
    _addEvents = function() {
      $doc.on('click', '#js-filter-nav', function(e) {
        var $element = $(e.target);

        e.preventDefault();
        if ($element.data('filter')) {
          _worksModule.loadWorks($element.data('filter'));
        }
        $(this).find('a').removeClass('selected');
        $element.addClass('selected');
      });
    },
    _init = function() {
     _worksModule = app.modules.works;
    };
  self.load = function() {
    _init();
    _addEvents();
  };
  return self;
}(app.modules.filters || {}));
