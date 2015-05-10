class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :body
      t.string :url
      t.string :type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
