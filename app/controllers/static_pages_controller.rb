class StaticPagesController < ApplicationController
  def login
  end
  
  def home
  	if signed_in?
  @question = current_user.questions.build 
  @feed_items = @current_user.feed.paginate(page: params[:page],:per_page => 5)
   end 
  end

end
