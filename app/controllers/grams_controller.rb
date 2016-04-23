class GramsController < ApplicationController
  def index
    @grams = Gram.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    redirect_to root_path unless current_user
    @gram = Gram.new
  end

  def create
    @gram = Gram.new(model_params)
    @gram.user = current_user

    if @gram.save
          redirect_to root_path unless current_user
      flash[:notice] = 'Gram Successfully Created!'
        redirect_to @gram
    else
      render :new
    end

  end

  def show
    @gram = Gram.find(params[:id])
  end

  def destroy
      redirect_to root_path unless current_user
    @gram = Gram.find(params[:id])
    @gram.destroy

    redirect_to grams_path
  end

  private

  def model_params
    params.require(:gram).permit(:title, :description, :location_code, :image_url)
    #"gram"=>{"title"=>"xxx", "description"=>"xxx", "location_code"=>"xxx"}
  end



end
