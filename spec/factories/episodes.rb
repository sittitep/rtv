FactoryBot.define do
  factory :episode do
    title { Faker::Movie.quote }
    plot { Faker::Lorem.paragraph_by_chars }
    season { nil }
    number { 1 }
  end
end
