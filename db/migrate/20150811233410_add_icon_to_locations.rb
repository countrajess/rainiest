class AddIconToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :icon, :string
    add_column :locations, :low, :integer
    add_column :locations, :high, :integer
  end
end
