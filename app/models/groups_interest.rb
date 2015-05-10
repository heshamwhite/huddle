class GroupsInterest < ActiveRecord::Base
  belongs_to :interest
  belongs_to :group
end
