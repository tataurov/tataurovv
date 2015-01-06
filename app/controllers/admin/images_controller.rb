class Admin::ImagesController < Admin::RootController

  def destroy
    Image.find(params[:id]).delete
    redirect_to admin_works_url
  end

  def index
    if params[:ids].present? && request.xhr?
      @images = Image.where(id: params[:ids])
      render :json => {:images => @images}
    end
  end

  def create
    @image = Image.new(image_params)


    respond_to do |format|
      if @image.save
        format.html
        format.json do
          render :json => @image
        end
      else
        format.html do
          redirect_to admin_works_url
        end
        format.json do
          render :json => {:status => :failed, :errors => @image.errors}
        end
      end
    end
  end

  def image_params
    params.require(:image).permit(:file, :title, :description, :work_id, :crop_x, :crop_y, :crop_w, :crop_h)
  end

  def crop
    @image = Image.find(params[:id])

    if request.xhr?
      render layout: false
    end
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      if request.xhr?
        render :json => {:status => :succsess}
      else
        redirect_to admin_crop_image_url(:params[:id])
      end

    else
      format.html do
        redirect_to admin_works_url
      end
      format.json do
        render :json => {:status => :failed, :errors => @image.errors}
      end
    end
  end

end