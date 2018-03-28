class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!
    # helper_method :current_user
    skip_before_filter :verify_authenticity_token

  def index
    super
  end

  def new
    super
  end

  def show
    super
  end

  # def approve
  #   # user.approve = true
  #   # user.save
  #         @user = User.find(params[:id])
  # put '/users', :to => 'users/registrations#update'
  # end

  def create
    @user = User.new(user_params)
    @user.approved = true # Approve all student users
	  if @user.save
		  flash[:success] = "Student User successfully created."
      sign_in(@user)
		  redirect_to user_root_path(@user)

	  else
		  render 'new'
	  end		
  end

  def dashboard
    @users = User.all
    begin
      @user = User.find(params[:id])
      sign_in(@user)
      # @user = current_user
    rescue
      redirect_to '/'
    ensure
    end
    # user.save
  end


  def new_admin
    build_resource
    yield resource if block_given?
    respond_with resource
  end

  def create_admin
    @user = User.new(user_params)
    @user.admin = true
    if @user.save
      flash[:success] = "School Admin successfully created."
      sign_in(@user)
      redirect_to user_root_path(@user)
      UserNotifier.confirmation_pending(@user)

    else
      render 'new_admin'
    end   
  end  

  def update
    super 
  end

  def landing
  end

  def edit
    # @user = User.find(params[:id])
     @user = current_user
  end

  # def approve_user
  #     # @users = User.all
  #     # @user = User.find_by_id(params[:id])
  #     @user.update_attributes(approved: params[:approved])
  #     respond_to do |format|
  #     flash[:notice] = "User has been approved"
  # end

  def user_params
		params.require(:user).permit(:id, :email, :password, :password_confirmation, :encrypted_password, :name, :date_of_birth, :school, :approved, :gender)
  end	
end 

