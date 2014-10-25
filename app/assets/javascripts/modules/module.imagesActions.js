app.modules.imagesActions = (function(self) {
  var
    _jcrop_api,
    _bounds, _boundx, _boundy,

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


      $('#js-cropbox').Jcrop({
        aspectRatio: 300 / 175,
        onSelect: _updateCoords,
        onChange: _updateCoords
      }, function() {
        _jcrop_api = this;
        _bounds = _jcrop_api.getBounds();
        _boundx = _bounds[0];
        _boundy = _bounds[1];
      });
    },

    _updateCoords = function(coords) {
      $('#image_crop_x').val(coords.x);
      $('#image_crop_y').val(coords.y);
      $('#image_crop_w').val(coords.w);
      $('#image_crop_h').val(coords.h);
      if (parseInt(coords.w) > 0)
      {
        var rx = 300 / coords.w;
        var ry = 175 / coords.h;

        $('#js-preview').css({
          width: Math.round(rx * _boundx) + 'px',
          height: Math.round(ry * _boundy) + 'px',
          marginLeft: '-' + Math.round(rx * coords.x) + 'px',
          marginTop: '-' + Math.round(ry * coords.y) + 'px'
        });
      }
    };

  self.load = function() {
    _init();
    _addEvents();
  };
  return self;
}(app.modules.imagesActions || {}));
