class BuyDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :city, :address,
    :building, :tel, :post_code

  # with_options presence: true do
    # validates :price, numericality: {...}
  # end
  # validates :prefecture, numericality: {...}

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Delivery.create(prefecture_id: prefecture_id, city: city,
      address: address, building: building, tel: tel, 
      post_code: post_code, buy_id: buy.id)
	end

end