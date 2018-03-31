class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date     :start_date
      t.date     :end_date
      t.integer  :user_id
      t.integer  :item_id
    end
    add_index    :bookings, :user_id
    add_index    :bookings, :item_id
  end
end
