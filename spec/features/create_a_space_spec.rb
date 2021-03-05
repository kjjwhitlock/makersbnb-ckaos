feature 'To list a space' do
  scenario 'User can create a space' do
    visit('/')
    sign_up
    visit('/spaces')
    click_button('Add a space')
    fill_in :name, with: 'Shangri-la'
    fill_in :description, with: 'Luxury penthouse in the heart of Shangri-la.'
    fill_in :price, with: '1000'
    fill_in :start_date, with: '05/05/2021'
    fill_in :end_date, with: '30/05/2021'
    click_button 'Submit'
    expect(page).to have_content 'Shangri-la'
    expect(page).to have_content 'Luxury penthouse in the heart of Shangri-la.'
    expect(page).to have_content 'Available from 2021-05-05 to 2021-05-30'
  end
end
