class AddPercentageToTarea < ActiveRecord::Migration[5.0]
  def change
    add_column :tareas, :percentage, :integer
  end
end
