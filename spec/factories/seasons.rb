FactoryBot.define do
  factory :season do
    title { Faker::Movie.quote }
    plot { Faker::Lorem.paragraph_by_chars }
    number { 1 }

    trait :with_episodes do

      transient do
        episodes_count { 3 }
      end

      after(:create) do |season, evaluator|
        evaluator.episodes_count.times do |index|
          create(:episode, season: season, number: index + 1)
        end
      end
    end

    after(:create) do |season|
      create(:content, resource: season)
    end
  end
end
