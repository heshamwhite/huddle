class AddColumnUsermessages < ActiveRecord::Migration
  def change
      add_column :usermessages, :seen, :boolean
  end
end
