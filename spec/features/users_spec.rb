require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'Users exist' do
    let!(:user) { create(:random_user) }

    it 'successfully login the user' do
      login_user(user)
    end
  end
end
