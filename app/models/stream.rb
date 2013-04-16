class Stream < ActiveRecord::Base
  attr_accessible :stream_id, :stream_name,:stream_table_name
has_many :stream_users 
has_many :users, through: :stream_users
has_many :questions
end
