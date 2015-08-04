class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.time :text_time
      t.integer :phone_no
      t.string :rain_preference
      t.string :text_preference

      t.timestamps null: false
    end
  end
end
