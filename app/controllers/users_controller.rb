class UsersController < ApplicationController

  def new 
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      redirect_to '/'
    else
      p 'check user'
      p user
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end 
  end


  private

  def user_params
    params.require(:user).permit(:last_name, :first_namea, :email, :password, :password_confirmation)
  end
 
end