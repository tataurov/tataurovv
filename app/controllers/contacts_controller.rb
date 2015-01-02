class ContactsController < ApplicationController
  def index
    @page = CmsPage.where(:name => 'contacts').first
  end
end
