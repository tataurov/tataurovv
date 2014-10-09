class AddNameAndDescriptionToWorkType < ActiveRecord::Migration
  def change
    add_column :work_types, :slug, :string
  end
end
