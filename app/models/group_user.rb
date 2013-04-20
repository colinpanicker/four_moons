class GroupUser < ActiveRecord::Base
  attr_accessible :group_id, :user_id
  belongs_to :user
  belongs_to :group
   validates :user_id, presence: true,uniqueness: true
end
