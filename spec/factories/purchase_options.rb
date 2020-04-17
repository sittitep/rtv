FactoryBot.define do
  factory :purchase_option do
    content { nil }
    price { [299, 399, 499].sample }
    video_quality { ["HD", "SD"].sample }
  end
end
