class Groupmessage < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :groupreplies
end
