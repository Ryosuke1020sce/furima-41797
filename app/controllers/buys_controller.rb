class BuysController < ApplicationController
  before_action :set_buy

  def index
    authenticate_user!
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_delivery = BuyDelivery.new
    return if (current_user.id != @item.user_id) && (@item.buy == nil)
    redirect_to root_path
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
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
  
  def set_buy
    @item = Item.find(params[:item_id])
  end


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
