feature 'Send a booking request' do
  scenario 'User can send a booking request' do
    space = Space.create(name: 'Disneyland', description: "Mickey and Minnie's house", price: 1000, host_id: '1')

    sign_up
    click_button 'View space'

    expect(current_path).to eq "/spaces/#{space.id}"
    fill_in :date, with: '01/01/2022'
    click_button 'Request to book'

    expect(current_path).to eq "/requests"
    expect(page).to have_content "Mickey and Minnie's house"
    expect(page).to have_content "Disneyland"
  end
end
