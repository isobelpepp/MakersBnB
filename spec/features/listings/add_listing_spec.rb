require_relative '../../helpers/web_helpers.rb'

feature 'Add a listing' do
  scenario 'user can see listing on page after posting it' do
    sign_up
    create_listing
    expect(current_path).to eq('/listings')
    expect(page).to have_content('Izzys Igloo')
  end
  scenario 'clicking on listing takes you to a page with it on' do
    sign_up
    create_listing
  end

  feature 'Viewing a listing page' do
    scenario 'it can be accessed via the listings page' do
      sign_up
      create_listing
      first('.listings').click_button 'View Listing'
      listingid = Listing.all[0].listing_id
      expect(current_path).to eq("/listings/#{listingid}")
      expect(page).to have_content 'Izzys Igloo'
      expect(page).to have_content 'Cold and icy'
      expect(page).to have_content '50'
    end
  end

  # scenario 'doesnt let user list a spcae unless logge in' do
end
