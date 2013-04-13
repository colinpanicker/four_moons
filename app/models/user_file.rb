class UserFile < ActiveRecord::Base
  attr_accessible :file, :file_name, :user_id ,:file_description
  belongs_to :user
  mount_uploader :file,FileUploader
end
