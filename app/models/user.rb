class User < ActiveRecord::Base
  has_and_belongs_to_many :interest
  has_and_belongs_to_many :group
  has_many :sent_usermessages, :class_name => "Usermessage", :foreign_key => "sender_id"
  has_many :received_usermessages, :class_name => "Usermessage", :foreign_key => "receiver_id"
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
