class CreatePubreplies < ActiveRecord::Migration
  def change
    create_table :pubreplies do |t|
      t.string :content
      t.integer :pub_id
      t.string :nickname
      t.timestamps null: false
    end
  end
end
