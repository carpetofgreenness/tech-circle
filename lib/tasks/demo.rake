# frozen_string_literal: true

namespace :demo do
  desc 'Create sampler data'
  task recreate: [:environment] do
    return unless Rails.env.development?

    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
    Rake::Task['demo:create'].invoke
  end

  task :create, [:count] => [:environment] do
    8.times do
      FactoryBot.create(:person)
    end

    Person.all.sample(3).each do |p|
      FactoryBot.create :techie, user: FactoryBot.create(:user, person: p)
    end

    Person.all.each do |person|
      2.times do
        FactoryBot.create(:request, requester: person, point_person: Techie.all.sample)
      end
      FactoryBot.create(:request, requester: person)
    end

    t_user = Techie.all.sample.user
    if t_user.update_column(:email, 'admin@example.com')
      t_user.reload
      puts "created techie #{t_user.person.name} with email: #{t_user.email} and password: 'password'"
    end
  end
end
