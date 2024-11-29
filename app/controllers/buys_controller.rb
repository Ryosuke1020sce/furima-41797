class BuysController < ApplicationController

  def index
    @buy = Buy.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy = Buy.create(buy_params)
    Delivery.create(delivery_params)
    redirect_to root_path
  end

  private

  def buy_params
    params.permit().merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def delivery_params
    params.permit(:prefecture_id, :city, :address, :building,
      :tel, :post_code).merge(buy_id: @buy.id)
  end

end
