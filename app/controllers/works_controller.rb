class WorksController < ApplicationController
  def index
    @works = if params[:type].present?
               Work.where(:work_type_id => params[:type])
             else
               Work.all
             end

    @rubrics = WorkType.all

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

end
