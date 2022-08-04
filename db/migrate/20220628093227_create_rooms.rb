class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      # t.string :id, null: false, primary_key: true
      t.string :room_name
      t.string :room_introduction
      t.integer :room_price
      t.string :room_address
      t.string :room_img

      t.timestamps
    end
  end
end
