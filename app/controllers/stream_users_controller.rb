class StreamUsersController < ApplicationController
      before_filter :signed_in_user

 
 def create
  @stream = Stream.find(params[:stream_user][:stream_id])
  current_user.follow_stream!(@stream)
  redirect_to @stream 
end


def destroy
  @stream = StreamUser.find(params[:id]).stream
  current_user.unfollow_stream!(@stream)
  redirect_to current_user 
end


end
