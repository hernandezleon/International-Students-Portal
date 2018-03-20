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

  def approve
    user.approve = true
    user.save
  end

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

    begin
      @user = User.find(params[:id])
      sign_in(@user)
      # @user = current_user
    rescue
      redirect_to '/'
    ensure
    end
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
    else
      render 'new_admin'
    end   
  end  

  def update
    super
  end

  def landing
  end

  def user_params
		params.require(:user).permit(:id, :email, :password, :password_confirmation, :encrypted_password, :name, :date_of_birth, :school)
  end	
end 

