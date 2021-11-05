# frozen_string_literal: true

# person refers to anyone in the directory
class Person < ApplicationRecord
  belongs_to :user, optional: true
  has_many :requests, foreign_key: :requester_id

  def name
    "#{first_name} #{last_name}"
  end
end
