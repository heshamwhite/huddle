class CreateGroupsInterestsJoinTable < ActiveRecord::Migration
  def change
    create_table :groups_interests, :id => false do |t|
      t.integer :group_id
      t.integer :interest_id
    end
    add_index :groups_interests, [ :group_id, :interest_id]
  end
end