class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
      t.string :name
      t.text :intro
      t.text :list
      t.string :imagefile
      t.text :time
      t.string :at
      t.integer :day
      t.timestamps null: false
    end
  end
end
