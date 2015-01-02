app.modules.works = (function(self) {
  var
    _loadWorks = function(filter) {
      _loadData(filter).success(function(data) {
        _renderWorks(data);
      });
    },

    _loadData = function(type_id) {
      return $.ajax({
        url: app.config.works_url,
        dataType: 'json',
        data: {
          type: type_id
        },
        error: function(e) {
          app.modules.global.showError(e);
        },
        beforeSend: function() {
          _coverWrapper();
        },
        complete: function() {
          _loadUncoverWrapper();
        }

      });
    },

    _coverWrapper = function() {

    },

    _loadUncoverWrapper = function() {

    },

    _renderWorks = function(data) {
      var
        $worksList = $('#works-list'),
        workView = JST['underscore/views/works/item'];

      $worksList.html('');
      if (data.length) {
        $.each(data, function(i, el) {
          $worksList
            .append(workView(el))
            .append(' ');
        });

        for(var i = 0; i < 6; i++) {
          $worksList
            .append($('<li>').addClass('wl-item dummy-'))
            .append(' ');
        }

        app.modules.Global.Scrollr.refresh();
      } else {
        $worksList.html('В данной категории работы не найдены.');
      }
    },

    _addEvents = function() {
    },
    _init = function() {

    };

  self.loadWorks = function(filter) {
    _loadWorks(filter)
  };

  self.load = function() {
    _init();
    _addEvents();
  };
  return self;
}(app.modules.works || {}));
