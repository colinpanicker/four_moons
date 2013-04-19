class Question < ActiveRecord::Base
  attr_accessible :content,:stream_id,:tag_list
   acts_as_taggable
   belongs_to :user
   belongs_to :stream

   has_many :replies, foreign_key: "ques_id"

   validates :content,  :presence => true
   validates :stream_id, :presence => true 
   validates :user_id, :presence => true

   default_scope order: 'questions.created_at DESC'

   def self.from_users_and_streams_followed_by(user)
      followed_user_ids = "SELECT followed_id FROM relationships
                           WHERE follower_id = :user_id"
      followed_stream_ids = "SELECT stream_id FROM stream_users
                                  WHERE user_id = :user_id"

     # followed_stream_user_ids = "SELECT user_id FROM questions 
      #                             WHERE stream_id IN (#{followed_stream_ids})"   
                                   #OR user_id IN (#{followed_stream_user_ids}                                              

      where("user_id IN (#{followed_user_ids}) OR user_id = :user_id OR stream_id IN (#{followed_stream_ids})",
               user_id: user.id)
 end



end
