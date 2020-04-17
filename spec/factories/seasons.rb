FactoryBot.define do
  factory :season do
    title { Faker::Movie.quote }
    plot { Faker::Lorem.paragraph_by_chars }
    number { 1 }
  end
end
