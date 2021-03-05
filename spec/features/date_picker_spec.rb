feature 'date picker' do
  scenario 'user can choose dates from datepicker' do
    user = User.create(name: 'Name', email: 'email@email.com', password: 'password')
    Space.create(name: 'Disney Land', description: 'Lots of fun', price: '100', host_id: user.id, start_date: '01/07/2021', end_date: '30/07/2021' )
    sign_up

    click_button 'View space'
    fill_in :date, with: '01/01/2022'
    click_button 'Request to book'

    expect(current_path).to eq '/requests'
    expect(page).to have_content '01/01/2022'
    expect(page).to have_content 'Disney Land'
  end
end
