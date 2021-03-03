feature 'user registration' do
  scenario 'greeted by name after registration' do
    sign_up

    expect(page).to have_content 'Hello, Test!'
    expect(page).not_to have_button 'Sign Up'
  end
end
