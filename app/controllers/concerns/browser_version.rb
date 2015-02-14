module BrowserVersion
  extend ActiveSupport::Concern

  included do
    before_filter :set_browser_type
  end

  def set_browser_type
    @browser_type = detect_browser
  end

  private

  MOBILE_BROWSERS = ['playbook', 'windows phone', 'android', 'ipod', 'iphone', 'opera mini', 'blackberry', 'palm','hiptop','avantgo','plucker', 'xiino','blazer','elaine', 'windows ce; ppc;', 'windows ce; smartphone;','windows ce; iemobile', 'up.browser','up.link','mmp','symbian','smartphone', 'midp','wap','vodafone','o2','pocket','kindle', 'mobile','pda','psp','treo']

  def detect_browser
    agent = request.headers['HTTP_USER_AGENT'].downcase

    MOBILE_BROWSERS.each do |m|
      return 'mobile' if agent.match(m)
    end
    'desktop'
  end
end