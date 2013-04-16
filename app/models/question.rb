class Question < ActiveRecord::Base
  attr_accessible :content,:stream_id

   belongs_to :user
   belongs_to :stream

   has_many :replies

   validates :content,  :presence => true
   validates :stream_id, :presence => true 
   validates :user_id, :presence => true

   default_scope order: 'questions.created_at DESC'

   def self.from_users_followed_by(user)
      followed_user_ids = "SELECT followed_id FROM relationships
                           WHERE follower_id = :user_id"
                           where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",user_id: user.id) 
   end



end
