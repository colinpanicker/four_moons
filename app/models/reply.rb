class Reply < ActiveRecord::Base
  attr_accessible :content,:ques_id

  belongs_to :ques, class_name: "Question"
  belongs_to :user
  
  validates :ques_id, :presence =>true 
  validates :user_id, :presence =>true 

  
   default_scope order: 'replies.created_at DESC'

end
