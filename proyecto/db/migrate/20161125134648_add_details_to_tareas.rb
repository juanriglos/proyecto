class AddDetailsToTareas < ActiveRecord::Migration[5.0]
  def change
    add_column :tareas, :created_at, :datetime
    add_column :tareas, :updated_at, :datetime
  end
end
