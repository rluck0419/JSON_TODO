class CreateTask < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :body
      t.int :list_id
      t.bool :completed
    end
  end
end
