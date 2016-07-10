class CreateTask < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :body, null: false
      t.integer :list_id, null: false, index: true
      t.boolean :completed, default: false
    end
    add_foreign_key :tasks, :lists
  end
end
