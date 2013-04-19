# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name ,:password ,:password_confirmation, :qualification, :designation,:image

  has_many :stream_users,dependent: :destroy
  has_many :user_files,dependent: :destroy
  has_many :streams, through: :stream_users
  has_many :group_users, dependent: :destroy
  has_many :group_requests,dependent: :destroy
  has_many :groups, through: :group_users
  has_many :posts, dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :notifications,dependent: :destroy

  
  has_many :questions , dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
            class_name: "Relationship",dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :replies



  has_secure_password

  mount_uploader :image,ImageUploader

  validates :name, presence: true, length: { maximum: 50 }

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }

 validates :password, presence: true, length: { minimum: 6 }
 validates :password_confirmation, presence: true

  def feed
   Question.from_users_and_streams_followed_by(self)
  end

  def following?(other_user)
   relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
   relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def following_stream?(stream)
   stream_users.find_by_stream_id(stream.stream_id)
  end

  def follow_stream!(stream)
   stream_users.create!(stream_id: stream.stream_id)
  end

  def unfollow_stream!(stream)
    stream_users.find_by_stream_id(stream.stream_id).destroy
end





private
  def create_remember_token
   self.remember_token = SecureRandom.urlsafe_base64
  end
  
  


end
