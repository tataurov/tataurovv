class Admin::WorksController < Admin::RootController

  def new
    @work = Work.new
    @work_types = WorkType.all
  end

  def create
    @work = Work.new(work_params)

    if params[:images].present?
      params[:images].each do |key, attr|
        if attr[:id].present?
          image = Image.find(attr[:id])
          @work.images << image
        end
      end
    end

    if @work.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def update
    @work = Work.find(params[:id])

    if @work.update(work_params)
      if params[:images].present?
        params[:images].each do |key, attr|
          if attr[:id].present?
            image = Image.find(attr[:id])
            @work.images << image
          end
        end
      end
      redirect_to works_url
    else
      render 'edit'
    end
  end

  def edit
    @work = Work.find params[:id]
    @images = @work.images
    @work_types = WorkType.all
  end

  def destroy
    Work.find(params[:id]).destroy
    redirect_to works_url
  end

  def index
    @works = Work.all.order(:created_at)
  end

  def show
    @work = Work.find params[:id]

  end

  def work_images
    @images = Work.find(params[:id]).images
    render :json => {:images => @images}
  end

  private

  def work_params
    params.require(:work).permit(:title, :description,:work_type_id, images_attributes: [:id, :file, :title, :description, :work_id])
  end

end
