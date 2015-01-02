class AboutController < ApplicationController
  def index
    @page = CmsPage.where(:name => 'about').first
  end
end
