class Buy < ApplicationRecord
  attr_accessor :token

  belongs_to :item
  belongs_to :user
  has_one :delivery
  
  validates :token, presence: true
  
end
