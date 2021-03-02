feature 'user registration' do
  scenario 'greeted by name after registration' do
    visit '/'
    fill_in :name, with: 'Test'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'test123'
    click_button 'Sign Up'

    expect(page).to have_content 'Hello Test!'
    expect(page).not_to have_button 'Sign Up'
  end
end
