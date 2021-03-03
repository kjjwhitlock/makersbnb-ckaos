feature 'listing multiple spaces' do
  xscenario 'spaces visible in user spaces page' do
    sign_up

    click_button 'Add a space'
    fill_in :name, with: 'Playboy Mansion'
    fill_in :description, with: 'Awesome pad'
    fill_in :price, with: '1000'
    click_button 'Submit'

    click_button 'Add a space'
    fill_in :name, with: 'Buckingham Palace'
    fill_in :description, with: 'Rather grand'
    fill_in :price, with: '9999'
    click_link 'My Spaces'

    expect(page).to have_content 'Playboy Mansion'
    expect(page).to have_content 'Buckingham Palace'
    expect(path).not_to eq '/spaces'
  end
end
