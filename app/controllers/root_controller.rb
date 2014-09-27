class RootController < ApplicationController
  def index
    @works = Work.all
  end
end
