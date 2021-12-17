class RequestStatus < ApplicationRecord
  has_many :requests

  def self.default
    @default ||= find_by(description: 'Unassigned')
  end

  def self.unstarted
    find_by(description: 'Unstarted')
  end
end
