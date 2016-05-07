class CreateBooths < ActiveRecord::Migration
  def change
    create_table :booths do |t|
      t.string :name
      t.text :intro
      t.text :content
      t.string :imagefile
      t.text :time
      t.string :at
      t.integer :day  
      t.timestamps null: false
    end
  end
end
