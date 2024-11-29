class BuysController < ApplicationController

  def new
    @buy = Buy.new
  end

  def create
    binding.pry
    @buy = Buy.create(buy_params)
    Delivery.create(delivery_params)
    redirect_to root_path
  end

  private

  def buy_params
    params.merge(user_id: current_user.id,item_id: params[:id])
  end

  def delivery_params
    params.permit(:prefecture_id, :city, :address, :building,
      :tel, :post_code).merge(buy_id: @buy.id)
  end

end
