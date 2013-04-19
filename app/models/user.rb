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

  has_secure_password

  mount_uploader :image,ImageUploader

  validates :name, presence: true, length: { maximum: 50 }

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }

 validates :password, presence: true, length: { minimum: 6 }
 validates :password_confirmation, presence: true

private
  def create_remember_token
   self.remember_token = SecureRandom.urlsafe_base64
  end
  

end
