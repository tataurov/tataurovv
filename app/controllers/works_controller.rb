class WorksController < ApplicationController
  def index
    @woks = Work.all
  end

  def show
    @work = Work.find(params[:id])
  end
end
