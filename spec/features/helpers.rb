def sign_up
  visit '/'
  fill_in :name, with: 'Test'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'test123'
  click_button 'Sign Up'
end

def sign_in
  visit('/')
  click_button('sign_in')
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'test123'
  click_button('sign_in')
end

def add_space
  click_button('Add a space')
  fill_in :name, with: 'Shangri-la'
  fill_in :description, with: 'Luxury penthouse in the heart of Shangri-la.'
  fill_in :price, with: '1000'
  fill_in :start_date, with: '01/05/2021'
  fill_in :end_date, with: '25/05/2021'
  click_button 'Submit'
end

def sign_up_renter
  visit '/'
  fill_in :name, with: 'Renter'
  fill_in :email, with: 'renter@email.com'
  fill_in :password, with: 'test123'
  click_button 'Sign Up'
end

def sign_in_renter
  visit('/')
  click_button('sign_in')
  fill_in :email, with: 'renter@email.com'
  fill_in :password, with: 'test123'
  click_button('sign_in')
end

def log_out
  visit('/spaces')
  click_button('sign_out')
end

def send_request
  click_button('View space')
  fill_in :date, with: '01/01/2022'
  click_button('Request to book')
end

def recieve_requests
  sign_up
  add_space
  log_out
  sign_up_renter
  send_request
  log_out
  sign_in
  click_button('requests_received')
end
