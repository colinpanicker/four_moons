class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index,:edit, :update]
  before_filter :correct_user,only: [:edit, :update]


  def new
   @user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
   @user = User.find(params[:id])
  end

  def create
   @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Four Moons!"
      redirect_to @user
    else
     render 'new'
    end
  end

  def edit
  @user = User.find(params[:id])
  end

def option
@user= User.find(params[:format])
end

  def update
     @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
       flash[:success] = "Profile updated"
       sign_in @user
       redirect_to @user
      else
        render 'edit'
      end
  end


def addstream
@user=User.find(params[:user_id])
StreamUser.delete_all(user_id: params[:user_id])
a=params[:user]
a.each_value do |val|
val.each do |f|
StreamUser.create(stream_id: f.to_s, user_id: params[:user_id])
end
end
redirect_to @user
end

def addimage
redirect_to root_path
end


private
  def signed_in_user
    redirect_to signin_path, notice: "Please sign in." unless signed_in?
  end
  
  def correct_user
   @user = User.find(params[:id])
   redirect_to(root_path) unless current_user?(@user)
end
end
