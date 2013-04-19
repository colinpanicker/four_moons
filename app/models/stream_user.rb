class StreamUser < ActiveRecord::Base
  attr_accessible :stream_id

belongs_to :user
belongs_to :stream

validates :user_id, presence: true
validates :stream_id, presence: true


end
