class UsersController < ApplicationController
  def index
    @users =User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(model_params)
    if @user.save
        redirect_to @user
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private

  def model_params
    params.require(:user).permit(:name, :email)
    #"gram"=>{"title"=>"xxx", "description"=>"xxx", "location_code"=>"xxx"}
  end



end
