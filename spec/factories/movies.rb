FactoryBot.define do
  factory :movie do
    title { Faker::Movie.quote }
    plot { Faker::Lorem.paragraph_by_chars }
  end
end
