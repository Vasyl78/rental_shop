class AddCityIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :city_id, :integer
    add_index  :users, :city_id
  end
end
