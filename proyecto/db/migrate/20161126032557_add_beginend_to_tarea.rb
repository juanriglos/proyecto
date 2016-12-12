class AddBeginendToTarea < ActiveRecord::Migration[5.0]
  def change
    add_column :tareas, :begin_time, :datetime
    add_column :tareas, :end_time, :datetime
  end
end
