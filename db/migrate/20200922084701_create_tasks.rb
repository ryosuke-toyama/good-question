class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.datetime :runtime,       null: false
      t.string :place,           null: false
      t.text :todo,              null: false
      t.boolean :checked,        null: false
      t.timestamps
    end
  end
end
