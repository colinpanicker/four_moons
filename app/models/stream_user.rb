class StreamUser < ActiveRecord::Base
  attr_accessible :stream_id, :user_id
belongs_to :user
belongs_to :stream

#validates {:stream_id , :user_id} , uniqueness: true 
end
