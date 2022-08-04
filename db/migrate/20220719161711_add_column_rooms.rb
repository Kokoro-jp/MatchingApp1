class AddColumnRooms < ActiveRecord::Migration[7.0]
  def up
    add_column :rooms, :room_id, :integer
  end

  def down
  end
end
