class Admin::ImagesController < Admin::RootController

  def destroy
    Image.find(params[:id]).delete
    redirect_to admin_works_url
  end

  def image_params
    params.require(:image).permit(:file, :title, :description, :work_id)
  end

end