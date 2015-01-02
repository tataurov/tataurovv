class CreateTableCmsPages < ActiveRecord::Migration
  def change
    create_table :cms_pages do |t|
      t.string :name
      t.text :content
      t.timestamps
    end
  end
end
