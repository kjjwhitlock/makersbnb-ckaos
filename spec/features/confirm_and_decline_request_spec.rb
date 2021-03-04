feature 'to make a decision about a recieved request' do
  scenario 'User can see recieved requests' do
    sign_up
    add_space
    log_out
    sign_up_renter
    send_request
    log_out
    sign_in
    click_button('requests_received')
    expect(page).to have_content 'Shangri-la'
  end
  scenario 'User can see recieved requests' do
    recieve_requests
    click_button('confirm')
    expect(page).to have_content 'Request confirmed'
  end
  scenario 'User can see recieved requests' do
    recieve_requests
    click_button('declined')
    expect(page).to have_content 'Request declined'
  end

end
