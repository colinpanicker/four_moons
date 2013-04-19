class GroupRequest < ActiveRecord::Base
  attr_accessible :group_id, :status, :user_id
  belongs_to :user
  belongs_to :group


end
