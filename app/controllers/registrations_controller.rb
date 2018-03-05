class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.new(user_params)
	if @user.save
		flash[:success] = "School successfully edited."
		redirect_to user_root_path(@user)
	else
		render 'new'
	end		
  end

  def update
    super
  end

  def user_params
		params.require(:user).permit(:id, :email, :password, :password_confirmation, :encrypted_password, :name, :date_of_birth)
  end	
end 