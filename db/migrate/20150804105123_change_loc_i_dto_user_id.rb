class ChangeLocIDtoUserId < ActiveRecord::Migration
  def change
    rename_column :users, :location_id, :user_id 
  end
end
