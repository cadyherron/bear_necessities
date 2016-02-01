class BearsController < ApplicationController

  def index
    @bears = Bear.all
  end

  def show
    @bear = Bear.find(params[:id])
  end



  def new
    @bear = Bear.new
  end

  def create
    @bear = Bear.new(whitelisted_bear_params)
    if @bear.save
      flash[:success] = "Bear #{@bear.name} successfully created"
      redirect_to @bear
    else
      flash.now[:error] = "Bear #{@bear.name} was not created"
      render :new
    end
  end


  def edit
    @bear = Bear.find(params[:id])
  end

  def update
    @bear = Bear.find(params[:id])
    if @bear.update(whitelisted_bear_params)
      flash[:success] = "Bear #{@bear.name} successfully updated"
      redirect_to @bear
    else
      flash[:error] = "Bear #{@bear.name} was not updated"
      render :edit
    end
  end



  def destroy
    @bear = Bear.find(params[:id])
    if @bear.destroy
      flash[:success] = "Bear #{@bear.name} deleted"
      redirect_to bears_path
    else
      flash.now[:error] = "Bear #{@bear.name} was not deleted."
      render :show
    end

  end





  def whitelisted_bear_params
    params.require(:bear).permit(:name, :description)
  end


end
