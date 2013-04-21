class UserChat < ActiveRecord::Base
  attr_accessible :chat_id, :file, :user_id
end
