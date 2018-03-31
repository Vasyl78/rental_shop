class AddCityIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :city_id, :integer
  end
end
