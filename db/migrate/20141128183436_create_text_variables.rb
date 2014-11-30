class CreateTextVariables < ActiveRecord::Migration
  def change
    create_table :text_variables do |t|
      t.string :name
      t.string :text
      t.timestamps
    end
  end
end
