class ReviewsController < ApplicationController
  respond_to :html, :js

  before_filter :authenticate_user!

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews.paginate(:page => params[:page], :per_page => 10).order('id DESC')

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /reviews/1/edit
  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
  end


  def create
    @restaurant = Restaurant.new(params[:restaurant])
    @restaurant.save
    respond_to do |format|
      format.js
    end
  end


  # POST /reviews
  # POST /reviews.json
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(params[:review])
    @review.save
    respond_to do |format|
      format.js
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end
end
