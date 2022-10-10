require 'rails_helper'

RSpec.describe "Requests", type: :request do
  describe "GET /new" do
    it 'loads successfully when logged in' do
      techie = create :techie
      sign_in techie.user
      get new_request_path
      expect(response).to have_http_status(200)
    end
  end
end
