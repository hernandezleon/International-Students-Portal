class MessagesController < ApplicationController
	before_action :find_message, only: [:edit, :update, :destroy]
	#before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@messages = Message.all.order("created_at DESC")
	end

	def show
		begin
			@message = Message.find(params[:id])
		rescue
			redirect_to '/messages'
		ensure
		end
	end

	def new
		@message = current_user.messages.build
		#@message = Message.new
	end

	def create
		@message = current_user.messages.build(message_params)
		#@message = Message.new(message_params)
		if @message.save
			redirect_to '/messages'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @message.update(message_params)
			redirect_to message_path
		else
			render 'edit'
		end
	end

	def destroy
		@message.destroy
		redirect_to '/messages'
	end
	
	private

		def message_params
			params.require(:message).permit(:title, :description)
		end

		def find_message
			@message = Message.find(params[:id])
		end

end
