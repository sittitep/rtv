# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.quote }
    plot { Faker::Lorem.paragraph_by_chars }

    trait :with_content do
      after(:create) do |movie|
        create(:content, resource: movie)
      end
    end
  end
end
