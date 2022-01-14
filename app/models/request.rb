# frozen_string_literal: true

class Request < ApplicationRecord
  after_create_commit { broadcast_prepend_to 'requests' }
  after_update_commit { broadcast_replace_to 'requests' }
  after_destroy_commit { broadcast_remove_to 'requests' }

  belongs_to :point_person, class_name: 'Techie'
  belongs_to :requester, class_name: 'Person'

  scope :open, -> { where('point_person_id is null') }

  validates :description, presence: true
end
