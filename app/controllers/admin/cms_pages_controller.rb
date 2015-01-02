class Admin::CmsPagesController < Admin::RootController

  def new
    @cms_page = CmsPage.new
  end

  def create
    @cms_page = CmsPage.new cms_params
    if @cms_page.save
      redirect_to :admin_cms_pages
    else
      render :edit
    end
  end

  def update
    @cms_page = CmsPage.find params[:id]
    if @cms_page.update(cms_params)
      redirect_to :admin_cms_pages
    else
      render :edit
    end

  end

  def edit
    @cms_page = CmsPage.find params[:id]
  end

  def index
    @cms_pages = CmsPage.all
  end

  def destroy
    CmsPage.find(params[:id]).destroy!
    redirect_to :admin_cms_pages
  end

  protected
  def cms_params
    params.require(:cms_page).permit(:id, :name, :content)
  end
end
