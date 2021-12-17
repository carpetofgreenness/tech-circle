# frozen_string_literal: true

class Techie < ApplicationRecord
  belongs_to :user
  has_one :person, through: :user
  has_many :requests, foreign_key: :point_person_id

  delegate :name, :email, to: :person

  def other_requests
    Request.assigned.where.not(id: requests)
  end
end
