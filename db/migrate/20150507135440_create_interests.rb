class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :interestname

      t.timestamps null: false
    end
  end
end
