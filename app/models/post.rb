class Post < ActiveRecord::Base
  attr_accessible :content, :group_id, :user_id
  belongs_to :user
  belongs_to :group
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  default_scope order: 'posts.created_at DESC'
 

end
