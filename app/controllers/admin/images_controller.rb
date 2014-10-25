class Admin::ImagesController < Admin::RootController

  def destroy
    Image.find(params[:id]).delete
    redirect_to admin_works_url
  end

  def create
    @image = Image.new(image_params)
    @image.save
  end

  def image_params
    params.require(:image).permit(:file, :title, :description, :work_id, :id, :crop_x, :crop_y, :crop_w, :crop_h)
  end

  def crop
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to works_url
    end
  end

end