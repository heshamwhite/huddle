class Groupreply < ActiveRecord::Base
  belongs_to :user
  belongs_to :groupmessage
end
