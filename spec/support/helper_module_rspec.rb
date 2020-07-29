module HelperModuleRspec
  def login_user(user)
    visit login_path
    within('form') do
      fill_in 'Name', with: user.name
    end
    click_button 'Log In'
  end

  def prep_article
    user
    category
    article
  end
end
