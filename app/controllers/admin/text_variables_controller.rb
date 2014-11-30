class Admin::TextVariablesController < Admin::RootController

  def edit
    @text_variable = TextVariable.find(params[:id])
  end

  def update
    @text_variable = TextVariable.find(params[:id])

    if @text_variable.update(text_variables_params)
      redirect_to admin_text_variables_url
    else
      render 'edit'
    end

  end

  def create
    @text_variable = TextVariable.new(text_variables_params)

    if @text_variable.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def new
    @text_variable = TextVariable.new
  end

  def index
    @text_variables = TextVariable.all
  end

  def text_variables_params
    params.require(:text_variable).permit(:name, :text)
  end
end