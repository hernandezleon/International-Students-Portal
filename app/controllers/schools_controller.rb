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
		 authorize! :update, @school
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
		# authorize! :update, @school
		# @school = School.first 
		begin
			@school = School.find(params[:id])
		rescue
			redirect_to '/schools'
		ensure
		end
	end	

	def new
		@school = School.new
		# @school = School.find(:all)
	end

	

	def school_params
		params.require(:school).permit(:id, :name, :abbreviation, :description,
											:city, :state, :semester_tuition, :living_expense, :athletics, :num_students,
											:school_contact_name, :school_contact_email, :zip_code, :phone_number, :steps, 
											:things_to_do_near, :organizations, :countries_of_international_students, :requirements)
	end
	
	def google_map(center)
		"https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=8&key=AIzaSyBwO1EzkdnkYm6gLZW1bN2ziLNRvOmdCP0"
	end
	helper_method :google_map

	# def find_school
	# 	@school = School.find(params[:id])
	# end


	
end
