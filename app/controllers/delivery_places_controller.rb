class DeliveryPlacesController < ApplicationController
   before_action :authenticate_customer!

  def index
    @delivery_places = current_customer.delivery_places
    @delivery_place = DeliveryPlace.new
  end

  def edit
    @delivery_place = DeliveryPlace.find(params[:id])
  end

  def create
    @delively_place = DeliveryPlace.new(delivery_params)
    @delively_place.customer_id = current_customer.id
    @delively_place.save
    @delivery_places = current_customer.delivery_places #index遷移用
  end

  def update
    @delivery_place = DeliveryPlace.find(params[:id])
    if @delivery_place.update(delivery_params)
      redirect_to delivery_places_path
    else
      render :edit
    end
  end

  def destroy
    @delivery_place = DeliveryPlace.find(params[:id])
    @delivery_place.destroy
    @delivery_places = current_customer.delivery_places #index遷移用
  end

  private

  def delivery_params
    params.require(:delivery_place).permit(:postcode, :address, :addressee)
  end

end
