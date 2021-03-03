feature 'authenticate' do
  scenario 'it allows a user to sign in with valid password and email' do
    visit('/sign_in')
    fill_in('email', with: 'email@email.com')
    fill_in('password', with: 'password')
    click_button('sign_in')
    expect(page).to have_content('Login successful')
  end
end
