require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  context 'User exist' do
    let!(:user) { create(:random_user) }

    it 'successfully creates a session' do
      login_user(user)
      expect(@current_user).to eql(user)
    end
  end
end
