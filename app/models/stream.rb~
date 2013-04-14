class Stream < ActiveRecord::Base
  attr_accessible :stream_id, :stream_name
has_many :stream_users 
has_many :users, through: :stream_users
end
