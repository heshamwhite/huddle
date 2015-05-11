class RenameColumnType < ActiveRecord::Migration
  def self.up
    rename_column :notifications, :type, :notificationtype
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
