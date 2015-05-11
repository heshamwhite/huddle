class CreateConfirms < ActiveRecord::Migration
  def change
    create_table :confirms do |t|
      t.text :confirmtext
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
