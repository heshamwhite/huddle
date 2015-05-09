class AddAttachmentGimageToGroupimages < ActiveRecord::Migration
  def self.up
    change_table :groupimages do |t|
      t.attachment :gimage
    end
  end

  def self.down
    remove_attachment :groupimages, :gimage
  end
end
