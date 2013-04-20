class GroupsController < ApplicationController
  def new
  	 @group = Group.new
  end

  def index
    @groups = Group.paginate(page: params[:page])
  end

  def create
     @group=Group.new(params[:group])
     @group.update_attributes(admin_id: params[:admin_id])
     group=Group.find(@group)
     GroupUser.create(user_id: params[:admin_id], group_id: group.id)
    if @group.save
      flash[:success] = "Welcome to Four Moons!"
      redirect_to @group
    else
     render 'new'
    end
  end

  def show
   
    @group=Group.find(params[:id])
    @posts = @group.posts.paginate(page: params[:page])

  
  end

  def sendrequest
    group=Group.find(params[:id])
    @request=GroupRequest.create(user_id: current_user.id, group_id: group.id, status: "pending")
    if @request.save
     flash[:success] = "request is sent"
     render 'index'
    end
  end

  def accept
    request=GroupRequest.find(params[:format])
    group=Group.find_by_id(request.group_id)
    if current_user.id==group.admin_id
      GroupUser.create(user_id: request.user_id,group_id:request.group_id)
      request.update_attributes(status: "confirmed")
      flash[:success]="request accepted"
    else
      flash[:error]="You dont have the privilege to accept the request"
     
    end 
      redirect_to group,:id=>group.id
    
  end

  def reject
    group=Group.find(params[:id])
    if current_user.id==group.admin_id
     request=GroupRequest.find(params[:format])
     request.update_attributes(status: "failed")
     flash[:success]="the request is rejected"
    else
      flash[:error]="You dont have the privilege to reject the request"
    end
    redirect_to group,:id=>group.id
  end

  def viewstatus
    render 'users/_status_messages'
  end

  def deletestatus
    GroupRequest.all.each do |request|
      if request.user_id==current_user.id 
        if request.status=="confirmed" || request.status=="failed"
          GroupRequest.destroy(request)
      else
        flash[:error]="You are not a valid user"
      end
    end
    redirect_to current_user,:id=>current_user.id
  end
end

def delete_group
  group=Group.find(params[:id])
  Group.destroy(group)
  redirect_to current_user,:id=>current_user.id
end
  
def leave
  group=Group.find(params[:id])
  user=group.group_users.find(current_user.id)
  GroupUser.destroy(user)
  flash[:success]="group deleted from ur list"
  redirect_to allgroups_path
end

end
