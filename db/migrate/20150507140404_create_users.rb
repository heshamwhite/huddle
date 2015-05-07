class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :hashedpassword
      t.integer :age
      t.text :bio
      t.string :email
      t.integer :isconfirm
      t.integer :usertype
      t.references :interest, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
