class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.date :target_date
      t.string :target_person
      t.integer :todo
      t.integer :list_id

      t.timestamps
    end
  end
end
