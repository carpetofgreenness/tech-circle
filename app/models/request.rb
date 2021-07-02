# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :point_person, class_name: 'Techie'
  belongs_to :requester, class_name: 'Person'
end
