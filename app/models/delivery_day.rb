class DeliveryDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 0, name: '１～２日で発送' },
    { id: 0, name: '２～３日で発送' },
    { id: 0, name: '４～７日で発送' }
  ]
  
  include ActiveHash::Associations
  has_many :items

 end