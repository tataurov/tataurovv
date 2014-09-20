class CreateWorkImages < ActiveRecord::Migration
  def change
    create_table :work_images do |t|
      t.string :title
      t.string :description
      t.integer :work_id

      t.timestamps
    end
  end
end
