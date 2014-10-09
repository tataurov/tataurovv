class Admin::WorkTypesController < Admin::RootController
  def new
    @work_type = WorkType.new
  end

  def create
    @work_type = WorkType.new(work_type_params)

    if @work_type.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def update
    @work_type = WorkType.find(params[:id])

    if @work_type.update(work_type_params)
      redirect_to admin_work_types_url
    else
      render 'edit'
    end
  end

  def edit
    @work_type = WorkType.find params[:id]
  end

  def destroy
    WorkType.find(params[:id]).destroy
    redirect_to admin_work_types_url
  end

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
