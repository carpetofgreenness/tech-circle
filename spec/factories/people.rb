# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    transient do
      name { Faker::TvShows::ParksAndRec.character }
    end
    first_name { name.split[0] }
    last_name { name.split[1] }
    sequence :email do |n|
      Faker::Internet.safe_email(name: "#{name.split[0]}#{n}")
    end
    Faker::Config.locale = 'en-US'
    phone_number { "215#{Faker::PhoneNumber.exchange_code}#{Faker::PhoneNumber.subscriber_number}" }
    city { Faker::TvShows::ParksAndRec.city }
    state { Faker::Address.state }
    address { Faker::Address.street_address }
    zip { Faker::Address.zip_code }
  end
end
