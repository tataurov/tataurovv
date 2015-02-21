app.modules.imagesActions = (function(self) {
  var
    _jcrop_api,
    _bounds, _boundx, _boundy,

    _imagesCount,  // Счетчик загруженых картинок
    _$uploadField, // Поле загрузки файлов
    _progress,

    // Возвращает id следующей записи картинки  depr*
    _nextImageRowId = function() {
      return $('#js-images-fields .image-row').length
    },

    // Добавляет строчку в список картинок depr*
    _addRow = function(id) {
      var
        imgView = JST['underscore/views/images/img_row'],
        html = imgView({id: id});
      $('#js-images-fields').append(html);
    },

    // Возвращает массив id-ов текущих картиноу
    _getImagesIds = function() {
      var ids = [];
      $('.js-image-row-preview').each(function() {
        ids.push($(this).data('id'));
      });
      return ids;
    },

    // Перезагрузка картинко на форме работы
    _reloadPreviewImages = function() {
      $.ajax({
        url: '/images',
        dataType: 'json',
        data: { ids: _getImagesIds() },
        success: function(e) {
          var
            images = e.images;

          $('#files').empty();
          _imagesCount = 0;
          for(var i = 0; i < images.length; i++) {
            _addPreviewRow({result: images[i]});
          }

        },
        error: function(e) {
         }
      });

    },

    // Добавление строки картинки
    _addPreviewRow = function(data) {
      var
        imgView = JST['underscore/views/images/img_preview_row'],
        html = imgView({
          file: data.result,
          id: _imagesCount
        });

      $('#files').append(html);
      _imagesCount += 1;
    },

    _addEvents = function() {
      $doc.on('click', '.js-add-field', function(e) {
        e.preventDefault();
        _addRow(_nextImageRowId());
      });


      // Загрузка в data описания и названия картинки
      _$uploadField.on('fileuploadsubmit', function (e, data) {
        data.formData = {
          'image[title]': $('#image_title').val(),
          'image[description]': $('#image_description').val(),
          'image[work_id]': app.config.work_id
        };
        _createProgress();
      });

      $doc.on('crop-popup', function() {
        _initCroper();
      });

      $doc.on('submit', '.crop-popup form', function(e) {
        var
          $form = $(this),
          $dialog = $form.closest('.ui-dialog');

        e.preventDefault();
        $.ajax({
          type: 'post',
          data: $form.serialize(),
          url: $form.attr('action'),
          success: function(e) {
            $('.ui-dialog-titlebar-close').click();
            _reloadPreviewImages(app.config.work_id);
          },
          error: function(e) {

          }
        });
      });
    },

    // Инициализация модуля
    _init = function() {
      _initCroper();
      _$uploadField = $('.js-file-upload');
      _initFileUpload();
      _imagesCount = $('#files img').length || 0;
    },

    // Инит Файл аплоадера
    _initFileUpload = function() {
      var
        url = '/images';

      _$uploadField.fileupload({
        url: url,
        dataType: 'json',
        start: function() {
          $('#files').showLoading();
        },
        done: function (e, data) {
          _addPreviewRow(data);
          _destroyProgress();
          $('#files').hideLoading();
        },
        progressall: function (e, data) {
          var progress = parseInt(data.loaded / data.total * 100, 10);
          _progress.update(progress);
        }
      });
    },

    // Инициализация плагина кропинга
    _initCroper = function() {
      $('.js-croper').Jcrop({
        aspectRatio: 300 / 500,
        onSelect: _updateCoords,
        onChange: _updateCoords,
        boxWidth: 300,
        boxHeight:500
      }, function() {
        _jcrop_api = this;
        _bounds = _jcrop_api.getBounds();
        _boundx = _bounds[0];
        _boundy = _bounds[1];
      });
    },

    // Перересовка прювьюхи кропа
    _updateCoords = function(coords) {
      $('#image_crop_x').val(coords.x);
      $('#image_crop_y').val(coords.y);
      $('#image_crop_w').val(coords.w);
      $('#image_crop_h').val(coords.h);
      if (parseInt(coords.w) > 0)
      {
        var rx = 300 / coords.w;
        var ry = 500 / coords.h;

        $('#js-preview').css({
          width: Math.round(rx * _boundx) + 'px',
          height: Math.round(ry * _boundy) + 'px',
          marginLeft: '-' + Math.round(rx * coords.x) + 'px',
          marginTop: '-' + Math.round(ry * coords.y) + 'px'
        });
      }
    },
    _createProgress = function() {
      _progress = Circles.create({
        id: 'js-progress',
        value: 0,
        radius: 60,
        width: 2,
        colors: ['#FCFCFC', '#797979']
      });
    },

    _destroyProgress = function() {
     $('#js-progress .circles-wrp').fadeOut(function() {
       delete(_progress);
     });
    };

  self.initCroper = function() { _initCroper(); };
  self.reloadPreviewImages = function() { _reloadPreviewImages(); };

  self.load = function() {
    _init();
    _addEvents();
  };

  return self;

}(app.modules.imagesActions || {}));
