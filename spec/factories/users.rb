FactoryBot.define do
  factory :user do

    nickname               {Faker::Name.initials(number:6)}
    email                  {Faker::Internet.email}
    password               {Faker::Internet.password(min_length: 4) + '1a'}
    password_confirmation  {password}
    family_name            {'山田'}
    first_name             {'太郎'}
    family_name_kana       {'ヤマダ'}
    first_name_kana        {'タロウ'}
    birthday               {Faker::Date.between(from: '1940-01-01', to: '2024-12-31' )}

  end
end
