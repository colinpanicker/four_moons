class PostsController < ApplicationController
  def new
  	@post=Post.new
  end

  def createpost
  	
    group=Group.find(params[:group_id])
    @post=Post.new(params[:post])
    @post.update_attributes(user_id: current_user.id, group_id: group.id)

  	if @post.save
  		flash[:success]="post created"
    end

     content=current_user.name + "clns has posted in clns" +group.group_name
     group.user_ids.each do |user|
       u=User.find_by_id(user)
       if !current_user?(u)
         Notification.create(user_id:u.id,content: content,content_type:"gpost")
       end
     end
     redirect_to group,:id=>params[:group_id]
  end

  def index
  end

  def show
    @post=Post.find(params[:id])
    group=Group.find(@post.group_id)
    redirect_to group,:id=>group.id
  end

  def addcomment
     @reply=Comment.new(params[:comment])
     @reply.update_attributes(post_id: params[:post_id], user_id: current_user.id)
     post=Post.find(params[:post_id])
     group=Group.find(post.group_id)
     poster=User.find(post.user_id)
     content=current_user.name + "clns has replied to your question: clns" + post.content + "clns in clns" +group.group_name
     Notification.create(user_id: poster.id,content: content, content_type: "greply")
     redirect_to group,:id=>group.id
  end

  def deletepost
    @post=Post.find(params[:format])
    Post.destroy(@post)
    redirect_to :back
  end

  def deletecomment
    @comment=Comment.find(params[:format])
    Comment.destroy(@comment)
    redirect_to :back
  end

end
