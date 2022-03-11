# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :point_person, class_name: 'Techie', optional: true
  belongs_to :requester, class_name: 'Person'
  belongs_to :request_type
  belongs_to :request_status

  before_validation :set_initial_status

  scope :open, -> { where(point_person_id: nil) }
  scope :assigned, -> { where.not(point_person_id: nil) }

  validates :description, presence: true

  private

  def set_initial_status
    return if persisted?

    self.request_status = point_person.present? ? RequestStatus.unstarted : RequestStatus.default
  end
end
