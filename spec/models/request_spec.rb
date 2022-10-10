require 'rails_helper'

RSpec.describe Request, type: :model do
  describe '#set_initial_status' do
    it 'sets unassigned request status before validation if it is first save' do
      request = build :request, request_status: nil
      expect(request.valid?).to be_truthy
      expect(request.request_status).to eq(RequestStatus.default)
    end

    it 'does not change the request status of a saved request on validation' do
      request = create :request, request_status: (create :request_status)
      expect { request.valid? }.not_to change(request, :request_status)
    end

    it 'sets the status to unstarted if the request has a point-person' do
      request = build :request, point_person: (create :techie), request_status: nil
      expect(request.valid?).to be_truthy
      expect(request.request_status).to eq(RequestStatus.unstarted)
    end
  end

  describe 'validations' do
    it 'is invalid without a description' do
      request = build :request, description: ''
      expect(request.valid?).to be_falsey
    end
  end
end
