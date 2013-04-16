class Reply < ActiveRecord::Base
  attr_accessible :content 

  belongs_to :questions
  
  validates :ques_id, :presence =>true 
  validates :user_id, :presence =>true 


end
