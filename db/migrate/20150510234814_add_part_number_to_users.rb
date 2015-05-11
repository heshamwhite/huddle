class AddPartNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
