class ChecklistsController < ApplicationController
  before_action :set_checklist, only: [:show, :edit, :update, :destroy]

  # GET /checklists
  # GET /checklists.json
  def index
    if params[:school].blank?
      @checklists = Checklist.all.order("school_name")
    else
      @school_id = School.find_by(name: params[:school]).id
      @checklist = Checklist.where(school_id: @school_id).order("name")
    #@checklists = Checklist.all
    end
  end

  # GET /checklists/1
  # GET /checklists/1.json
  def show
    # authorize! :update, @school
    begin
      @checklist = Checklist.find(params[:id])
    rescue
      redirect_to '/checklists'
    ensure
    end
    @checklists = Checklist.all
    @checklists.each do |c|
      school = School.find(c.school_id)
      c.school_name = school.name
      c.save
    end
  end

  # GET /checklists/new
  def new
    @checklist = Checklist.new
  end

  # GET /checklists/1/edit
  def edit
    authorize! :update, @school
    @checklist = Checklist.find(params[:id])
  end

  # POST /checklists
  # POST /checklists.json
  def create
    @checklist = Checklist.new(checklist_params)
    #@school = School.find(params[:id])

    respond_to do |format|
      if @checklist.save
        format.html { redirect_to @checklist, notice: 'Checklist was successfully created.' }
        format.json { render :show, status: :created, location: @checklist }
      else
        format.html { render :new }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
    @school = School.find(@checklist.school_id)
    @school.checklist_id = @checklist.id
    @school.save
    
  end

  # PATCH/PUT /checklists/1
  # PATCH/PUT /checklists/1.json
  def update
    respond_to do |format|
      if @checklist.update(checklist_params)
        format.html { redirect_to @checklist, notice: 'Checklist was successfully updated.' }
        format.json { render :show, status: :ok, location: @checklist }
      else
        format.html { render :edit }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklists/1
  # DELETE /checklists/1.json
  def destroy
    @checklist.destroy
    respond_to do |format|
      format.html { redirect_to checklists_url, notice: 'Checklist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def checklists_index
    @array = []
    @school = School.all.order('name')
    @school.each do |s|
      checklist = Checklist.where("school_id = s.id")
      @array << checklist
    end
    
  end

  def new_student_checklist_school_select
    @user_checklist = Userchecklist.new
  end
  #helper_method :new_student_checklist_school_select

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist
      @checklist = Checklist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checklist_params
      params.require(:checklist).permit(:id, :act_score, :sat_score, :high_school_transcript, :previous_college_transcript, :i_20, :visa_proof,
                                        :application_fee, :online_application, :school_name, :school_id)
    end
end

