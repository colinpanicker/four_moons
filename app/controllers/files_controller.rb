class FilesController < ApplicationController
  def new
  	@user_file=UserFile.new
  	render 'new'
  	
  end
 

  def addfile
  	@user=User.find_by_id(params[:user_id])
    a=params[:user_file]
  	@user_file=UserFile.create(user_id: params[:user_id], file_name: a["file_name"], file: a["file"])
  	redirect_to @user
  end 

  def list
    @user=User.find(params[:format])
     render 'list'
  end

  def download
    user_file=UserFile.find(params[:format])
    send_file 'public'+user_file.file_url
  end

  def delete_file
    user_file=UserFile.find(params[:format])
    UserFile.destroy(user_file)
    flash[:success]="File deleted"
    redirect_to :back
  end
end
