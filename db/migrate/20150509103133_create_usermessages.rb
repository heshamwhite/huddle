class CreateUsermessages < ActiveRecord::Migration
  def change
    create_table :usermessages do |t|
      t.string :title
      t.text :body
      t.references :sender
      t.references :receiver
      t.timestamps null: false
    end
  end
end
