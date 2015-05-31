class RootController < ApplicationController
  def index

    @works = Work.all.order('random()').includes(:images)
    @rubrics = WorksStatistics.get_rubrics_with_statistics

  end
end
