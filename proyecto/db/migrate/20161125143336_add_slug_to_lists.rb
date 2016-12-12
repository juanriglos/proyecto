class AddSlugToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :slug, :string
    add_index :lists, :slug
  end
end
