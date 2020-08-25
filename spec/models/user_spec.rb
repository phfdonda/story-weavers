require 'rails_helper'

RSpec.describe 'User' do
  context 'user doesn\'t exist' do
    let(:long_name) { 'a' * 25 }

    it 'can create a new user' do
      create(:random_user)
      expect(User.last).to be_present
    end

    it 'can\'t create a new user due to not having a name' do
      user = build(:random_user)
      user.name = nil
      expect(user.valid?).to eql(false)
    end

    it 'can\'t create a new user due to a long name' do
      user = build(:random_user)
      user.name = 'a' * 25
      expect(user.valid?).to eql(false)
    end
  end
end
