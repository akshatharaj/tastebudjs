class RestaurantsController < ApplicationController
  respond_to :html, :js

  before_filter :authenticate_user!

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])
    @restaurant.save
    respond_to do |format|
      format.js 
    end
  end

  def index
    @restaurants = Restaurant.search(params[:search], params[:page])
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    respond_with @restaurant
  end

end
