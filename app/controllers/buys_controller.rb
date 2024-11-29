class BuysController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_delivery = BuyDelivery.new
    @item = Item.find(params[:item_id])
    return if (current_user.id != @item.user_id) && (Buy.where(item_id: @item.id).count == 0)
    redirect_to root_path
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    @item = Item.find(params[:item_id])
    if @buy_delivery.valid?
      pay_item(@item.price)
      @buy_delivery.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:buy_delivery).permit(:prefecture_id, :city, :address, :building,
      :tel, :post_code).merge(user_id: current_user.id, item_id: params[:item_id],
      token: params[:token])
  end

  def pay_item(item_price)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item_price,          # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'              # 通貨の種類（日本円）
    )
  end

end
