class Group < ActiveRecord::Base
  attr_accessible :admin_id, :group_name
  has_many :group_users,dependent: :destroy
  has_many :group_requests,dependent: :destroy
  has_many :users,through: :group_users
  has_many :posts, dependent: :destroy
  validates :group_name, presence: true,uniqueness: { case_sensitive: false }
  
 
end
