class ReviewsController < ApplicationController
  respond_to :html, :xml

  before_filter :load_restaurant

  private

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def index
    @reviews = @restaurant.reviews.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = @restaurant.reviews.find(params[:id])
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = @restaurant.reviews.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @restaurant.reviews.new(params[:review])

    respond_to do |format|
      if @review.save
        format.html { redirect_to [@restaurant, @review], notice: 'Review was successfully created.' }
      else
        format.html { render action: "new" }
      end
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
