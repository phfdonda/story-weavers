module HelperModuleRspec
  def login_user(user)
    visit login_path
    within('form') do
      fill_in 'Name', with: user.name
    end
    click_button 'Log In'
  end

  def logout_user(_user)
    visit root_path
    within('nav') do
      click_link 'Log Out'
    end
  end

  def prep_article
    user = create(:random_user)
    category = create(:random_category)
    article = create(:random_article)
    [user, category, article]
  end
end
