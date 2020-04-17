FactoryBot.define do
  factory :purchase do
    expired_at { Time.zone.now + 2.days }
    
    association :user, factory: :user
    
    trait :expired do
      expired_at { Time.zone.now - 2.days }
    end

    trait :with_purchase_items do
      transient do
        purchase_items_count { 1 }
      end

      after(:create) do |object, evaluator|
        evaluator.purchase_items_count.times do |index|
          create(:purchase_item, purchase: object)
        end
      end
    end    
  end
end
