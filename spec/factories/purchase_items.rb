FactoryBot.define do
  factory :purchase_item do
    association :purchase, factory: :purchase
    association :purchase_option, factory: :purchase_option
  end
end
