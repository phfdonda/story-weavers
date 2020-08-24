module HelperModuleRspec
  def login_user(user)
    visit login_path
    within('form') do
      fill_in 'Name', with: user.name
    end
    click_button 'Log In'
  end

  def logout_user
    visit root_path
    within('nav') do
      click_link 'Log Out'
    end
  end

  def test_vote
    login_user(user)
    LastArticle.refresh
    visit root_path
    click_link 'categ-link', visible: false
    click_link 'Vote'
  end
end
