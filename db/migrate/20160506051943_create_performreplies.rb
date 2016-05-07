class CreatePerformreplies < ActiveRecord::Migration
  def change
    create_table :performreplies do |t|
      t.string :content
      t.integer :perform_id

      t.timestamps null: false
    end
  end
end
