class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
    render json: {success: true, restaurants: @restaurants}
  end

  def show
    @restaurant = Restaurant.includes(:reviews).find(params[:id])
    render json: {success: true, restaurant: @restaurant.as_json({include: [:reviews]})}
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: {success: true, restaurant: @restaurant} 
    else
      render json: {success: false, errors: @restaurant.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    if @restaurant.update(restaurant_params)
      render json: {success: true, restaurant: @restaurant} 
    else
      render json: {success: false, errors: @restaurant.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    render json: {success: true}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :desc, :addr_1, :addr_2, :addr_city, :addr_code, :addr_state, :addr_country, :phone_1)
    end
end
