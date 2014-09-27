class Admin::WorksController < Admin::RootController

  def new
    @work = Work.new
    @work.images.build
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def update
    @work = Work.find(params[:id])

    if @work.update(work_params)
      redirect_to works_url
    else
      render 'edit'
    end
  end

  def edit
    @work = Work.find params[:id]
  end

  def destroy
    Work.find(params[:id]).destroy
    redirect_to works_url
  end

  def index
    @works = Work.all
  end

  def show
    @work = Work.find params[:id]

  end


  def work_params
    params.require(:work).permit(:title, :description, images_attributes: [:file, :title, :description, :work_id])
  end

end
