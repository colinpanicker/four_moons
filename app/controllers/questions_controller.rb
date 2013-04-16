class QuestionsController < ApplicationController
     before_filter :signed_in_user, only: [:create, :destroy]
     before_filter :correct_user, only: :destroy


    def index
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

  private
    def correct_user
     @question = current_user.questions.find_by_id(params[:id])
     redirect_to root_path if @question.nil?
    end


end
