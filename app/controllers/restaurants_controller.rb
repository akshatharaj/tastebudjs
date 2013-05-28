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
    @restaurants = Restaurant.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
  end

  def search
    @restaurants = Restaurant.search params[:search]
   end

end
