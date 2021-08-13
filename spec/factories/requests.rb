# frozen_string_literal: true

FactoryBot.define do
  factory :request do
    requester { create :person }
    point_person { create :techie }
    description { Faker::TvShows::Buffy.quote }
  end
end
