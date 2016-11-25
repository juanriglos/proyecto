class CreateTareas < ActiveRecord::Migration[5.0]
  def change
    create_table :tareas do |t|
      t.integer :list_id
      t.string :type
      t.string :description
      t.string :state
      t.integer :priority
    end
  end
end
