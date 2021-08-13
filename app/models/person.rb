# frozen_string_literal: true

class Person < ApplicationRecord
  belongs_to :user, optional: true

  def name
    "#{first_name} #{last_name}"
  end
end
