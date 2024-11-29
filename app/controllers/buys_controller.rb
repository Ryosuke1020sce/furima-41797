class BuysController < ApplicationController

  def index
    @buy_delivery = BuyDelivery.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:buy_delivery).permit(:prefecture_id, :city, :address, :building,
      :tel, :post_code).merge(user_id: current_user.id, item_id: params[:item_id],
      token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_d825933d656bdb371ff6c60b"
    Payjp::Charge.create(
      amount: buy_params[:price],  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'              # 通貨の種類（日本円）
    )
  end

end
