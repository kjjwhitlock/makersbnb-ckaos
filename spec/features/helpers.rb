def sign_up
  visit '/'
  fill_in :name, with: 'Test'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'test123'
  click_button 'Sign Up'
end
