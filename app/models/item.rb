class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  belongs_to :user
  has_one_attached :image

  validates :name, :explain, :image, :price, presence: true 
  validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id,
    :delivery_day_id, numericality: { other_than: 1, message: "can't be blank"}
 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
