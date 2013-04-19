class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id, :user_id
   belongs_to :user
  belongs_to :post
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  default_scope order: 'comments.created_at DESC'
end
