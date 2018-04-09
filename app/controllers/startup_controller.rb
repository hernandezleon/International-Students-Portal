class StartupController < ApplicationController
	# before_action :find_school, only: ['dashboard']

	def index
  	end

	def aboutus
  	end

  	def dashboard
  		# @users = User.all
  		if params[:approved] == "false"
      		@users = User.where(approved: false)
    	else
      		@users = User.all
    	end
  	end

end


