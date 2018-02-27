class SchoolsController < ApplicationController
	# before_action :find_school, only: ['create','show']


	def index
		@school = School.all.order("name")
	end

	def create
		@school = School.new(school_params)
		if @school.save
			flash[:success] = "School successfully edited."
			redirect_to school_path(@school)
		else
			render 'new'
		end		
	end

	def edit
		 # @school = School.name 
		 @school = School.find(params[:id])
		 # render 'edit'
	end

	def update
		 @school = School.find(params[:id])

		if @school.update(school_params)
			redirect_to school_path(@school)
		else 
			render 'edit'
		end
	end

	def destroy
		# @school.destroy
		# redirect_to school_path(@school)
		@school = School.find(params[:id])
		# if @school.present?
		@school.destroy
		# end
		redirect_to '/schools'
	end

	def show
		 # @school = School.first 
		 @school = School.find(params[:id])
	end	

	def new
		@school = School.new
		# @school = School.find(:all)
	end

	

	def school_params
		params.require(:school).permit(:id, :name, :abbreviation, :description,
											:city, :state, :semester_tuition, :athletics,
											 :school_contact_name, :school_contact_email)
	end

	# def find_school
	# 	@school = School.find(params[:id])
	# end


	
end
