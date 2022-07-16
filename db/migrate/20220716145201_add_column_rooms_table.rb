class AddColumnRoomsTable < ActiveRecord::Migration[7.0]
  def up
    add_column :rooms, :user_id, :integer, null: false, foreign_key: true
  end

  def down
    remove_column :rooms, :user_id
  end
end
