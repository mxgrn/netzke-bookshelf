class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :author_id
      t.string :title
      t.integer :exemplars
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
