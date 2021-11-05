# frozen_string_literal: true

FactoryBot.define do
  factory :request do
    requester { create :person }
    description { Faker::TvShows::Buffy.quote }

    trait :with_techie do
      point_person { create :techie }
    end
  end
end
