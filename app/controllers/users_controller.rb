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
      flash[:notice] = 'User Successfully Created!'
        redirect_to @user
    else
      flash.now[:error] = "Failed to Create User!"
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
    @grams = @user.grams.page(params[:page]).per(5)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private

  def model_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    #"gram"=>{"title"=>"xxx", "description"=>"xxx", "location_code"=>"xxx"}
  end



end
