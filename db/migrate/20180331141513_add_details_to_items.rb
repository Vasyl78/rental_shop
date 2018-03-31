class AddDetailsToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :category_id, :integer
    add_column :items, :brand, :string
    add_column :items, :size, :integer
  end
end
