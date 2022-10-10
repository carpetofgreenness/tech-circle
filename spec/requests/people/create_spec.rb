# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "People POST /people", type: :request do
  describe "POST /people" do
    it 'successfully creates a request when the params are valid' do
      techie = create :techie
      sign_in techie.user
      request = build :request
      post requests_path, params: {
        request: { requester_id: request.requester_id,
                   point_person_id: request.point_person_id,
                   description: request.description,
                   request_type_id: request.request_type_id,
                   request_status_id: request.request_status_id } }
      expect(response).to redirect_to(requests_path)
    end

    it 're-renders the new page if the params are invalid' do
      techie = create :techie
      sign_in techie.user
      request = build :request
      post requests_path, params: {
        request: { requester_id: request.requester_id,
                   point_person_id: request.point_person_id } }
      expect(response).to redirect_to(new_request_path)
    end
  end
end
