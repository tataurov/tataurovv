# -*- encoding : utf-8 -*-
class WorksController < ApplicationController
  def index
    @works = if params[:type].present?
               Work.where(:work_type_id => params[:type]).includes(:images)
             else
               Work.all.includes(:images)
             end

    @rubrics = WorksStatistics.get_rubrics_with_statistics

    respond_to do |format|
      format.html
      format.json do
        @works = @works.with_images
        render :json => @works
      end
    end
  end

  def show
    @works = Work.all.order('id')
    @work = Work.find(params[:id])

    @next_work_id = @works[next_work_id(@works, @work)].try(:id)
    @prev_work_id = @works[prev_work_id(@works, @work)].try(:id)

    set_page_titles_by_work(@work)

  rescue ActiveRecord::RecordNotFound
    render_404
  end

  protected

  def next_work_id(works, work)
    if works.index(work) + 1 >= works.size
      0
    else
      works.index(work) + 1
    end
  end

  def prev_work_id(works, work)
    if works.index(work) - 1 <= 0
      works.size - 1
    else
      works.index(work) - 1
    end
  end

  def set_page_titles_by_work(work)
    @seo_title = 'Галерея работ резьбы по дереву'
    @seo_description = work.title + ', ' + work.description
  end

end
