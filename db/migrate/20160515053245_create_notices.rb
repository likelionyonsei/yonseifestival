class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string "noticetitle"
      t.text "noticecontent"
      t.string "noticewriter"
      t.integer :notice_id
      
      t.timestamps null: false
    end
  end
end
