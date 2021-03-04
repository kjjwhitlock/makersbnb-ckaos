feature 'date picker' do
  scenario 'user can choose dates from datepicker' do
    Space.create(name: 'Disney Land', description: 'Lots of fun', price: '100')
    sign_up

    click_button 'View space'
    fill_in :date, with: '01/01/2022'
    click_button 'Request to book'

    expect(current_path).to eq '/requests'
    expect(page).to have_content '01/01/2022'
    expect(page).to have_content 'Disney Land'
  end

  scenario 'dates are greyed out if a booking has been confirmed on those dates for that space' do
    Space.create(name: 'Disney Land', description: 'Lots of fun', price: '100')
    sign_up
  end
end
