class RootController < ApplicationController
  def index
    @works = Work.all.order('random()')
    @rubrics = WorkType.all
  end
end
