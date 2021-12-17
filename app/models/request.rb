# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :point_person, class_name: 'Techie', optional: true
  belongs_to :requester, class_name: 'Person'
  belongs_to :request_type

  scope :open, -> { where(point_person_id: nil) }
  scope :assigned, -> { where.not(point_person_id: nil) }


  validates :description, presence: true
end
