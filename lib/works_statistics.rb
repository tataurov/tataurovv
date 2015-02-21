module WorksStatistics

  # Public Мелод получения статистки по работам
  # work - Array of works || nil
  #
  # Returns Array
  def self.get_rubrics_with_statistics
    works = Work.all.map
    rubrics = WorkType.all.map

    rubrics_with_stats = []

    rubrics.each do |rubric|
      rubrics_with_stats << {
        :id => rubric.id,
        :name => rubric.name,
        :description => rubric.description,
        :slug => rubric.slug,
        :works_count => works.select { |wt| wt['work_type_id'] == rubric.id }.count,
        :total => works.count
      }
    end

    rubrics_with_stats
  end

  def self.total
    Work.count
  end
end