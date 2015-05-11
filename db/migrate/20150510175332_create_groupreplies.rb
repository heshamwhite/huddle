class CreateGroupreplies < ActiveRecord::Migration
  def change
    create_table :groupreplies do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :groupmessage, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
