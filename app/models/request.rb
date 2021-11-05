# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :point_person, class_name: 'Techie', optional: true
  belongs_to :requester, class_name: 'Person'

  scope :open, -> { where('point_person_id is null') }
end
