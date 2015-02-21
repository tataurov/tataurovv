$.fn.extend({
  showLoading: function() {
   this
     .addClass('loader-item')
     .wrapInner($('<div>').addClass('loader-wrapper clearfix'))
     .append($('<div>').addClass('loader'));
  },
  hideLoading: function() {
    this
      .removeClass('loader-item')
      .find('.loader').remove().end()
      .find('.loader-wrapper').contents().unwrap();
  }
});