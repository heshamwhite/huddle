class Groupimage < ActiveRecord::Base
  mount_uploader :gimage, GimageUploader
  belongs_to :group
  has_attached_file :gimage, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :gimage, :content_type => /\Aimage\/.*\Z/
end
