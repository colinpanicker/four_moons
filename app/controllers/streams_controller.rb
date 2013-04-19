class StreamsController < ApplicationController
	def show
		@stream=Stream.find(params[:id])
        @questions = @stream.questions.paginate(page: params[:page],:per_page => 5)
	end

	def index
       @streams = Stream.paginate(page: params[:page])

    end

    def stream_followers
     @title = "Followers"
     @stream = Stream.find(params[:id])
     @users = @stream.users.paginate(page: params[:page])
     render 'show_followers'
    end


end
