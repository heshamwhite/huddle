class CreateGroupmessages < ActiveRecord::Migration
  def change
    create_table :groupmessages do |t|
      t.string :title
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
