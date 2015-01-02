class WorksController < ApplicationController
  def index
    @works = if params[:type].present?
               Work.where(:work_type_id => params[:type])
             else
               Work.all
             end

    @rubrics = WorkType.all

    respond_to do |format|
      format.html
      format.json do
        @works = @works.with_images
        render :json => @works
      end
    end
  end

  def show
    @work = Work.find(params[:id])
  end
end
