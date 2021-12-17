# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :point_person, class_name: 'Techie', optional: true
  belongs_to :requester, class_name: 'Person'

  scope :open, -> { where(point_person_id: nil) }
  scope :assigned, -> { where('point_person_id is not null') }


  validates :description, presence: true
end
