require "juggernaut"

class ChatController < ApplicationController
	def send_message
	@messg = params[:msg_body]
	@sender = params[:sender]
	

	Juggernaut.publish(select_channel("/channel1_channel2"), parse_chat_message(params[:msg_body], params[:sender]))	
  	#@user=User.find(params[:id])
	#@chatt=UserChat.new(params[:id])
	#@chatt.user_id=@user
	#@chatt.file=UserChat.random_string(3)
	#File.open(@chatt.file,"a+"){|f| f << @messg<< "\n"}
  	
  	end
	

	def parse_chat_message(msg, user)
	return "#{user}: #{msg}"
	end

	def select_channel(receiver)
	puts "#{receiver}"
	return "/chats#{receiver}"
	end
end

