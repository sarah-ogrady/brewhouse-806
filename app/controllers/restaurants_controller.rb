class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [ :show, :edit, :update, :destroy ]

  def index
    @restaurants = Restaurant.all
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(set_restaurant)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def edit
    # @restaurant = Restaurant.find(params[:id])
  end

  def update
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.update(set_restaurant)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def set_restaurant
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
