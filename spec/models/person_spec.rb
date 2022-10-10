require 'rails_helper'

RSpec.describe Person, type: :model do
  describe '#name' do
    it 'concatenates first name and last name' do
      person = create :person, first_name: 'Silly', last_name: 'Billy'
      expect(person.name).to eq('Silly Billy')
    end
  end
end
