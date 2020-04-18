# frozen_string_literal: true

FactoryBot.define do
  factory :purchase_option do
    price { [299, 399, 499].sample }
    video_quality { %w[HD SD].sample }

    association :content, factory: :content
  end
end
