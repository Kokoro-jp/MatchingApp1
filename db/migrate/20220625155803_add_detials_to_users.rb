class AddDetialsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :img, :string
    add_column :users, :introduction, :string
  end
end
