class CreateBooths < ActiveRecord::Migration
  def change
    create_table :booths do |t|
      t.string :name
      t.text :intro
      t.text :content
      t.string :imagefile
      t.string :time_hour
      t.string :time_min
      t.string :at
      t.integer :day  
      t.timestamps null: false
    end
  end
end
