class Admin::WorksController < Admin::RootController

  def new
    @work = Work.new
    @images = @work.images
    @image = @work.images.build
    @work_types = WorkType.all
  end

  def create
    @work = Work.new(work_params)
    if work_params[:images_attributes]
      work_params[:images_attributes].each do |key, attr|
        if attr[:id].present?
          image = Image.find(attr[:id])
          image.title  = attr[:title] if attr[:title]
          image.description  = attr[:description] if attr[:position]
          image.save
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
      if params[:images]
        params[:images].each { |image|
          @work.images.create(file: image)
        }
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

  private

  def create_images

  end

  def work_params
    params.require(:work).permit(:title, :description,:work_type_id, images_attributes: [:id, :file, :title, :description, :work_id])
  end

end
