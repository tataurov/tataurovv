# -*- encoding : utf-8 -*-
class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!

  layout 'admin/layouts/application'

  def index
  end

end