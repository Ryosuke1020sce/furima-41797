class BuysController < ApplicationController

  def index
    @buy_delivery = BuyDelivery.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      @buy_delivery.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.permit(:prefecture_id, :city, :address, :building,
      :tel, :post_code).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
