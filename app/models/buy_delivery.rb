class BuyDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :city, :address,
    :building, :tel, :post_code, :token

  with_options presence: true do
    validates :city, :address, :token
    validates :tel, format: { with: /\A[\d]{10,11}\z/, message: '10～11桁、「-」ハイフンなしで記入してください' }
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '「000-0000」の形で記入してください' }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Delivery.create(prefecture_id: prefecture_id, city: city,
      address: address, building: building, tel: tel, 
      post_code: post_code, buy_id: buy.id)
	end

end