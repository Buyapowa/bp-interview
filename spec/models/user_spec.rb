require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates presence of first name' do
      user = User.new(first_name: nil)
      expect(user.valid?).to be_falsey
      expect(user.errors[:first_name]).to include("can't be blank")
    end
  end

  describe '#full_name' do
    it 'returns the full name of the user' do
      user = User.new(first_name: 'John', last_name: 'Doe')
      expect(user.full_name).to eq('John Doe')
    end

    it 'returns only the first name if last name is nil' do
      user = User.new(first_name: 'John', last_name: nil)
      expect(user.full_name).to eq('John')
    end
  end
end
