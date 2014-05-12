class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :completed, default: false
      t.text :note

      t.timestamps
    end
  end
end
