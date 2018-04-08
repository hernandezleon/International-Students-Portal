class UserchecklistsController < ApplicationController
	
	def new
		@user_checklist = Userchecklist.new
	end

	def create
		@user_checklist = Userchecklist.new(userchecklist_params)
		@user_checklist.userid = current_user.id
		@cl_id = @user_checklist.id
		
		@school = School.find(@user_checklist.school_id)

		@school_checklist = Checklist.find(@school.checklist_id)
		#@school_checklist = Checklist.where(school_id: 3)

		#@user_checklist.act_score = @school_checklist.act_score
		if @school_checklist.act_score == true
			@user_checklist.act_score = false
		else
			@user_checklist.act_score = nil
		end

		if @school_checklist.sat_score == true
			@user_checklist.sat_score = false
		else
			@user_checklist.sat_score = nil
		end

		if @school_checklist.high_school_transcript == true
			@user_checklist.high_school_transcript = false
		else
			@user_checklist.high_school_transcript = nil
		end

		if @school_checklist.previous_college_transcript == true
			@user_checklist.previous_college_transcript = false
		else
			@user_checklist.previous_college_transcript = nil
		end

		if @school_checklist.i_20 == true
			@user_checklist.i_20 = false
		else
			@user_checklist.i_20 = nil
		end

		if @school_checklist.visa_proof == true
			@user_checklist.visa_proof = false
		else
			@user_checklist.visa_proof = nil
		end

		if @school_checklist.application_fee == true
			@user_checklist.application_fee = false
		else
			@user_checklist.application_fee = nil
		end

		if @school_checklist.online_application == true
			@user_checklist.online_application = false
		else
			@user_checklist.online_application = nil
		end

		if @user_checklist.save
			redirect_to :action => :index
		else
			render 'new'
		end
		#@cl_id = @user_checklist.id
		#redirect_to edit_userchecklist_path(@user_checklist)
	end

	def index
		@school_checklist = Checklist.where(school_id: @user_checklist.school_id)
	end

	def show
		@user_checklist = Userchecklist.find(params[:id])
		redirect_to edit_userchecklist_path(@user_checklist)
	end

	def edit
		@user_checklist = Userchecklist.find(params[:id])
		@school = School.find(@user_checklist.school_id)
	end

	def update
		@user_checklist = Userchecklist.find(params[:id])
    respond_to do |format|
      if @user_checklist.update(userchecklist_params)
        format.html { redirect_to @user_checklist, notice: 'Checklist was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_checklist }
      else
        format.html { render :edit }
        format.json { render json: @user_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
	end

	private

    # Never trust parameters from the scary internet, only allow the white list through.
    def userchecklist_params
      params.require(:userchecklist).permit(:id, :act_score, :sat_score, :high_school_transcript, :previous_college_transcript, :i_20, :visa_proof,
                                        :application_fee, :online_application, :school_id, :user)
    end

end
