class Notification < ActiveRecord::Base
  attr_accessible :content, :content_type,:user_id
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
end
