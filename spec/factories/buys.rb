FactoryBot.define do
  factory :buy do
    token {"tok_abcdefghijk00000000000000000"}
    association :user, :item
  end
end
