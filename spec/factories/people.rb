# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    transient do
      name { Faker::TvShows::ParksAndRec.character }
      city { Faker::TvShows::ParksAndRec.city }
    end
    first_name { name.split[0] }
    last_name { name.split[1] }
    email { "#{last_name}.#{first_name}@#{city}.gov" }
    phone_number { Faker::PhoneNumber }
  end
end
