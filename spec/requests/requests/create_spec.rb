require 'rails_helper'

RSpec.describe "Requests", type: :request do
  describe "POST /people" do
    it 'successfully creates a person' do
      techie = create :techie
      sign_in techie.user
      person = build :request
      post requests_path, params: { request: { first_name: person.first_name,
                                               last_name: person.last_name,
                                               email: person.email,
                                               phone_number: person.phone_number,
                                               address: person.address,
                                               city: person.city,
                                               zip: person.zip } }
      expect(response).to redirect_to(people_path)
    end
  end
end
