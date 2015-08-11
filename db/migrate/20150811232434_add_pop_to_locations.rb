class AddPopToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :pop, :integer
  end
end
