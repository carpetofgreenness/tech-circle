# frozen_string_literal: true

class Techie < ApplicationRecord
  belongs_to :user
  belongs_to :person

  delegate :name, to: :person
end
