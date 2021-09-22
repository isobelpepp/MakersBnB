require_relative '../../helpers/web_helpers.rb'

xfeature 'Request to book' do
  scenario 'user can request certain dates to book a listing' do
    sign_up
    create_listing
    first('.listings').click_button 'View Listing'
    fill_in('start date', with: '01/02/2021')
    fill_in('end date', with: '10/02/2021')
    click_button('Request to book')
    expect(page).to have_content('Requested bookings')
    expect(page).to have_content('Izzys Igloo')
    expect(page).to have_content('Date requested: 01/02/2021 - 10/02/2021')
    expect(page).to have_content('Confirmed: false')
  end
end
