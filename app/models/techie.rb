# frozen_string_literal: true

class Techie < ApplicationRecord
  belongs_to :user
  has_one :person, through: :user

  delegate :name, to: :person
end
