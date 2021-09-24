# frozen_string_literal: true

FactoryBot.define do
  factory :techie do
    user { association :user, :with_person }
  end
end
