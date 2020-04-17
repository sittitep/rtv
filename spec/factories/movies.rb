FactoryBot.define do
  factory :movie do
    title { Faker::Movie.quote }
    plot { Faker::Lorem.paragraph_by_chars }

    after(:create) do |movie|
      create(:content, resource: movie)
    end
  end
end
