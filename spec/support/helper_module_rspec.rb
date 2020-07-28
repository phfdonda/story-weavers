module HelperModuleRspec
  def login_user(user)
    visit login_path
    within('form') do
      fill_in 'Name', with: user.name
    end
    click_button 'Log in'
  end
end
