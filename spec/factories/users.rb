# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    transient do
      name { Faker::TvShows::ParksAndRec.character }
    end

    sequence :email do |n|
      Faker::Internet.safe_email(name: "#{name.split[0]}#{n}")
    end
    password              { 'password' }
    password_confirmation { password }
    confirmed_at          { Time.now }

    trait :with_person do
      after(:create) do |user, evaluator|
        create :person, name: evaluator.name, email: user.email, user: user
      end
    end
  end
end
