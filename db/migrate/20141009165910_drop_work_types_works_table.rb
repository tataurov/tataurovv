class DropWorkTypesWorksTable < ActiveRecord::Migration
  def change
    drop_table :work_types_works
    add_column :works, :work_type_id, :integer
  end
end
