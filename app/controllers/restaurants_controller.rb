class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])
    if @restaurant.save
      redirect_to new_restaurant_path
    end
  end

  def index
    @restaurants = Restaurant.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def search
    @restaurants = Restaurant.search params[:search]
   end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

end
