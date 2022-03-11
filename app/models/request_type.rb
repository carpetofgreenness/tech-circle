class RequestType < ApplicationRecord
  has_many :requests

  validates :description, presence: true
end
