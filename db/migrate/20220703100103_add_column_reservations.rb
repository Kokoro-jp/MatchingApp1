class AddColumnReservations < ActiveRecord::Migration[7.0]
  def up
    add_column :reservations, :user_id, :integer
    add_column :reservations, :room_id, :integer
  end

  def down
  end
end
