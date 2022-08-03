class AddUserIdToRooms < ActiveRecord::Migration[7.0]
  def up
    add_column :rooms, :user_id, :integer
  end

  def down
  end

end
