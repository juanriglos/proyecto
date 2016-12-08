class CreateTareas < ActiveRecord::Migration[5.0]
  def change
    create_table :tareas do |t|
      t.integer :list_id
      t.string :type
      t.string :description
      t.string :state
      t.integer :priority
    
      t.index [:list_id], name: "index_tareas_on_list_id"
    end
  end



end
