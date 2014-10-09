class WorkTypesController < ApplicationController

  def index
    @work_types = WorkType.all
  end

  def show
    @work_type = WorkType.find params[:id]
  end

  def work_type_params
    params.require(:work_type).permit(:name, :description, :slug)
  end

end
