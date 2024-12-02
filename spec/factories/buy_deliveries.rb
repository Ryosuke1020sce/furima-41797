FactoryBot.define do
  factory :buy_delivery do

    token          { "tok_abcdefghijk00000000000000000" }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    city           { Faker::Address.city}
    address        { Faker::Address.street_address }
    building       { Faker::Address.building_number }
    tel            { Faker::Number.leading_zero_number(digits: 11)}
    post_code      { "123-4567" }
    
  end
end
