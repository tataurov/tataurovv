#encoding: utf-8

class ApplicationController < ActionController::Base
  include UrlHelper

  before_filter :seo_description, :seo_site_name, :seo_title, :seo_keywords
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def seo_title
    return @seo_title if defined? @seo_title
    @seo_title = TextVariable.where(:name => 'title').first.try(:text) || 'Портфолио Татаурова Василия'
  end

  def seo_description
    return @seo_description if defined? @seo_description
    @seo_description = TextVariable.where(:name => 'description').first.try(:text) || 'Собрание работ мастера резьбы по дереву Татаурова Василия Лазаревича'
  end

  def seo_site_name
    return @seo_site_name if defined? @seo_site_name
    @seo_site_name = TextVariable.where(:name => 'site_name').first.try(:text) || 'Портфолио Татаурова Василия'
  end

  def seo_keywords
    return @seo_keywords if defined? @seo_keywords
    @seo_keywords = TextVariable.where(:name => 'keywords').first.try(:text) || 'дерева дереву заказ из изготовления изделий изделия на по продажу резных резьба'
  end


  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
end
