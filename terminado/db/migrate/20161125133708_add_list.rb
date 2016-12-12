class AddList < ActiveRecord::Migration[5.0]
  def change
    create_table :lists, force: :cascade do |t|
    t.datetime :created_at, null: false
    t.datetime :updated_at, null: false
    t.string   :name
    t.string   :URL
    
  end
  end

end
