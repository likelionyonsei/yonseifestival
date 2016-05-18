class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
      t.string :name
      t.text :intro
      t.text :list
      t.string :imagefile
      t.string :time_hour
      t.string :time_min
      t.string :like
      t.string :at
      t.integer :day
      t.timestamps null: false
    end
  end
end
