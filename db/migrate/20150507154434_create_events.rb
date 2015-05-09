class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.float :lat
      t.float :log
      t.text :desc
      t.datetime :date
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
