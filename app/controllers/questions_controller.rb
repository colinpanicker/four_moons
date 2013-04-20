class QuestionsController < ApplicationController
     before_filter :signed_in_user, only: [:create, :destroy]
     before_filter :correct_user, only: :destroy


    def index
      if params[:tag]
        @questions = Question.tagged_with(params[:tag]).paginate(page: params[:page]) 
      else
        @questions = Question.paginate(page: params[:page])
      end  
    end

    def show
       @question = Question.find(params[:id])

    end  

	  def create
		    @question = current_user.questions.build(params[:question])
           if @question.save
            flash[:success] = "Question submitted!"
            redirect_to root_path
          else
             @feed_items = []
             render 'static_pages/home'
           end

    end
    
    def destroy
      @question.destroy
      redirect_back_or root_path
    end

    def createreply
      @reply=current_user.replies.build(params[:reply])
      @reply.update_attributes(ques_id: params[:ques_id])
      question=Question.find(params[:ques_id])
      user=User.find(question.user_id)
      stream=Stream.find(question.stream_id)
      content=current_user.name+"clns has replied to your question:clns"+question.content+" clns in clns"+stream.stream_name
      Notification.create(user_id: user.id,content: content,content_type: "sreply")
      if @reply.save
        flash[:success]="reply posted"
      else
        flash[:error]="Couldn't post reply"
      end
      redirect_to :back
    end

    def deletereply
      reply=Reply.find(params[:format])
      Reply.destroy(reply)
      redirect_to :back
    end


  private
    def correct_user
     @question = current_user.questions.find_by_id(params[:id])
     redirect_to root_path if @question.nil?
    end


end
