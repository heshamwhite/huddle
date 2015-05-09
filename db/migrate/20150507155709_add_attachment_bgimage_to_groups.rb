class AddAttachmentBgimageToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :bgimage
    end
  end

  def self.down
    remove_attachment :groups, :bgimage
  end
end
