class AddAttachmentGroupavatarToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :groupavatar
    end
  end

  def self.down
    remove_attachment :groups, :groupavatar
  end
end
