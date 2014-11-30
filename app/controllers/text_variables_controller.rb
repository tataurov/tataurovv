class TextVariablesController < ApplicationController

  def show
    @text_variable = TextVariable.find params[:id]
  end


  def index
    @text_variables = TextVariable.all
  end

end
