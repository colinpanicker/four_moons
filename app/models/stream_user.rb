class StreamUser < ActiveRecord::Base
  attr_accessible :stream_id, :user_id
belongs_to :user
belongs_to :stream

end
