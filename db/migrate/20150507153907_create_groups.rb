class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.float :lat
      t.float :log
      t.text :desc
      t.string :membertitle
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
