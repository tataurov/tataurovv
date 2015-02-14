#encoding: utf-8

class ApplicationController < ActionController::Base
  include UrlHelper
  include BrowserVersion

  before_filter :set_page_titles
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  def set_page_titles
    vars = TextVariable.all.to_a

    @seo_title = vars.select { |v| v.name == 'title' }.first.try(:text) || 'Портфолио Татаурова Василия'
    @seo_description = vars.select { |v| v.name == 'description' }.first.try(:text) || 'Собрание работ мастера резьбы по дереву Татаурова Василия Лазаревича'
    @seo_site_name = vars.select { |v| v.name == 'site_name' }.first.try(:text) || 'Портфолио Татаурова Василия'
    @seo_keywords = vars.select { |v| v.name == 'site_name' }.first.try(:text) || 'дерева дереву заказ из изготовления изделий изделия на по продажу резных резьба'
  end

  def mobile?
    @browser_type == 'mobile'
  end

  def desktop?
    !mobile?
  end
  helper_method :desktop?, :mobile?

end
