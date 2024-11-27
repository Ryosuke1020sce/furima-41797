FactoryBot.define do
  factory :item do
    name             { Faker::Name.name }
    explain          { Faker::Lorem.sentence }
    category_id      { Faker::Number.between(from: 2, to: 11) }
    condition_id     { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id  { Faker::Number.between(from: 2, to: 3) }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    delivery_day_id  { Faker::Number.between(from: 2, to: 4) }
    price            { Faker::Number.between(from: 1000, to: 100_000) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
