# frozen_string_literal: true

FactoryBot.define do
  factory :request do
    requester { create :person }
    description { Faker::TvShows::Buffy.quote }
    request_type { RequestType.all.sample }

    trait :with_techie do
      point_person factory: :techie
    end
  end
end
