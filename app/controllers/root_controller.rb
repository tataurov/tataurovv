class RootController < ApplicationController
  def index
    @works = Work.all
    @rubrics = WorkType.all
  end
end
