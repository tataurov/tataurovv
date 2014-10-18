app.modules.imagesActions = (function(self) {
  var

    // Возвращает id следующей записи картинки
    _nextImageRowId = function() {
      return $('#js-images-fields .image-row').length
    },

    // Добавляет строчку в список картинок
    _addRow = function(id) {
      var
        imgView = JST['underscore/views/images/img_row'],
        html = imgView({id: id});
      $('#js-images-fields').append(html);
    },

    _addEvents = function() {
      $doc.on('click', '.js-add-field', function(e) {
        e.preventDefault();
        _addRow(_nextImageRowId());
      });

    },
    _init = function() {

    };
  self.load = function() {
    _init();
    _addEvents();
  };
  return self;
}(app.modules.imagesActions || {}));
