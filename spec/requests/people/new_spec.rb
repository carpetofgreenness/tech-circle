# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "People GET /new", type: :request do
  describe "GET /new" do
    it 'loads successfully when logged in' do
      techie = create :techie
      sign_in techie.user
      get new_person_path
      expect(response).to have_http_status(200)
    end
  end
end
