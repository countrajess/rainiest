class AddLocationIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location_id, :integer
    remove_column :users, :user_id
  end
end
