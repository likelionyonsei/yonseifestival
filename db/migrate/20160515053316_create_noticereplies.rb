class CreateNoticereplies < ActiveRecord::Migration
  def change
    create_table :noticereplies do |t|
      t.text :noticecontent
      t.integer :notice_id

      t.timestamps null: false
    end
  end
end
