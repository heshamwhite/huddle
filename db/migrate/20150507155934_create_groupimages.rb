class CreateGroupimages < ActiveRecord::Migration
  def change
    create_table :groupimages do |t|
      t.references :group, index: true, foreign_key: true
      t.text :desc

      t.timestamps null: false
    end
  end
end
