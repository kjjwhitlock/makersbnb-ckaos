feature 'authenticate' do
  scenario 'it allows a user to sign in with valid password and email' do
    User.create(name: 'Name', email: 'email@email.com', password: 'password')
    visit('/sessions/new')
    fill_in('email', with: 'email@email.com')
    fill_in('password', with: 'password')
    click_button('sign_in')
    expect(page).to have_content('Hello, Name')
  end
  scenario 'redirects user back to /sessions/new when authentication fails' do
    User.create(name: 'Name', email: 'email@email.com', password: 'password')
    visit('/sessions/new')
    fill_in('email', with: 'email@email.com')
    fill_in('password', with: 'wrong_password')
    click_button('sign_in')
    expect(page).to have_content('Check your email or password!')
  end
  scenario 'redirects user back to / and signs out after user clicks sign out' do
    User.create(name: 'Name', email: 'email@email.com', password: 'password')
    visit('/sessions/new')
    fill_in('email', with: 'email@email.com')
    fill_in('password', with: 'password')
    click_button('sign_in')
    click_button('sign_out')
    expect(page).to have_content ""
  end

end
