class Stream < ActiveRecord::Base
attr_accessible :stream_id, :stream_name,:stream_table_name
has_many :stream_users 
has_many :users, through: :reverse_stream_users
has_many :questions

has_many :reverse_stream_users,foreign_key: "stream_id",class_name: "StreamUser",dependent: :destroy


validates :stream_name, presence: true
validates :stream_id, presence: true
end
