feature 'To list a space' do
  scenario 'User can create a space' do
    visit('/')
    sign_up
    visit('/spaces')
    click_button('Add a space')
    fill_in :name, with: 'Shangri-la'
    fill_in :description, with: 'Luxury penthouse in the heart of Shangri-la.'
    fill_in :price, with: '1000'
    click_button 'Submit'
    expect(page).to have_content 'Shangri-la'
    expect(page).to have_content 'Luxury penthouse in the heart of Shangri-la.'
  end
end
