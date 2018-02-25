class SchoolsController < ApplicationController
	def new
		@school = School.new
		# @school = School.find(:all)
	end

	def create
		@school = School.new(school_params)
		if @school.save
			flash[:success] = "School successfully edited."
			redirect_to @school
		else
			render 'new'
		end		
	end

	def school_params
		params.require(:school).permit(:name, :description, :city, :state, :school_contact_name)
	end
	def show
		render 'new'
	end	
end
