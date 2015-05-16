  require 'active_record'
  require 'geokit'
class Group < ActiveRecord::Base
  # acts_as_mappable :default_units => :kms,
  #                  :default_formula => :sphere,
  #                  :distance_field_name => :distance,
  #                  :lat_column_name => :lat,
  #                  :lng_column_name => :log
  has_and_belongs_to_many :user
  has_many :events
  has_many :groupmessages
  has_many :groupimages
  accepts_nested_attributes_for :groupimages

  has_attached_file :bgimage, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :bgimage, :content_type => /\Aimage\/.*\Z/
  has_attached_file :groupavatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :groupavatar, :content_type => /\Aimage\/.*\Z/
end
