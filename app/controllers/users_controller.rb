class UsersController < ApplicationController
  # before_action :admin?, only: :index
  params.require(:user).permit(:school_name, checklist_ids:[])
  # def index
  #   if params[:approved] == false
  #     @users = User.where(approved: false)
  #   else
  #     @users = User.all
  #   end
  # end

  def approve_user
    user = User.find(params[:id])
    user.approved = true
    if user.save
      flash[:notice] = "#{user.name} approved"
    else
      flash[:alert] = "#{user.name} approval failure"
    end
    redirect_to :back
  end

  # def get_modal
  #   @user = User.find(params[:id])
  # end

  def reject_user
    user = User.find(params[:id])
    user.approved = false
    user.delete

    # if user.save
    #   flash[:notice] = "#{user.name} approved"
    # else
    #   flash[:alert] = "#{user.name} approval failure"
    # end
    redirect_to :back
  end

# private
#   def admin?
#     redirect_to '/login' unless current_user.admin == true
#   end

end