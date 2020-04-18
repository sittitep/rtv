# frozen_string_literal: true

FactoryBot.define do
  factory :content do
    association :resource, factory: :movie
  end
end
