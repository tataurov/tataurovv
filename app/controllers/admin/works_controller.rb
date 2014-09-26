class Admin::WorksController < Admin::RootController

  def new
    @work = Work.new
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
  end

  def index
    @works = Work.all
  end

  def show
    @work = Work.find params[:id]
  end


  def work_params
    params.require(:work).permit(:title, :description)
  end

end
