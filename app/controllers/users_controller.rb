class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index,:edit, :update, :following, :followers]
  before_filter :correct_user,only: [:edit, :update]
  before_filter :admin_user, only: :destroy




  def new
   @user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page])

  end

def formdata
     @name=params[:name]
     res=User.find_all_by_name(@name)
     res2=User.find_by_name(@name)
     res3=User.find_all_by_email(@name)
     res4=User.find_by_email(@name)
     res5=User.find_all_by_qualification(@name)
     res6=User.find_by_qualification(@name)
     res7=User.find_all_by_designation(@name)
     res8=User.find_by_designation(@name)
     #res2=User.find_by_email(@name)
     #@answer=res
     #@userid=@answer[0].id
     #@check=res[0].name
     if res2 
          @answer=res
          render 'show_1'
     else
      if res4
        @answer=res3
        render 'show_1'
      else
        if res6
          @answer=res5
          render 'show_1'
        else
          if res8
            @answer=res7
            render 'show_1'
          else
          render 'show_2'
        end
        end
      end
     end     
 end 

  def show
   @user = User.find(params[:id])
   @questions = @user.questions.paginate(page: params[:page],:per_page => 5)
   @users = User.find(:all, :conditions =>   {:active => true})
   @users.delete current_user

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

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
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

def addimage
  @user=User.find(params[:id])
  @user.update_attributes(image: params[:user])
  redirect_to @user
end


def stream_following
 @title = "Streams of Interests"
   @user = User.find(params[:id])  
   @streams = @user.streams.paginate(page: params[:page])
   render 'show_streams',:id=>@user.id
end


 def del_notifications
    current_user.notifications.each do |f|
      Notification.destroy(f)
    end
    redirect_to current_user,:id=>current_user.id
  end

   def delete_profile
    
    User.destroy(current_user)
    flash[:success]="Profile Deleted"
     self.current_user = nil
     cookies.delete(:remember_token)
     redirect_to root_path
  end




def following
@title = "Following"
@user = User.find(params[:id])
@users = @user.followed_users.paginate(page: params[:page])
render 'show_follow'
end

def followers
@title = "Followers"
@user = User.find(params[:id])
@users = @user.followers.paginate(page: params[:page])
render 'show_follow'
end


private

  def correct_user
   @user = User.find(params[:id])
   redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

end
