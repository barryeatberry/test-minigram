class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user.present? && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email/password'
      render :new
    end
  end

  def destroy
      session.delete(:user_id)
      @current_user = nil
      flash[:notice] = "Log Out Complete!"
      redirect_to root_path
    end


end
