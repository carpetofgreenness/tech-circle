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
    5.times do
      FactoryBot.create(:request)
    end
  end
end
