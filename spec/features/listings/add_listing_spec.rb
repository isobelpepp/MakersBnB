require_relative '../../helpers/web_helpers.rb'

feature 'Add a listing' do
  scenario 'user can see listing on page after posting it' do
    sign_up
    log_in
    visit '/listings'
    click_button('Add Listing')
    fill_in('name', with: 'Izzys Igloo')
    fill_in('description', with: 'Cold and icy')
    fill_in('price', with: 50)
    click_button('List My Space')
    expect(current_path).to eq('/listings')
    expect(page).to have_content('Izzys Igloo')
  end
  # scenario 'clicking on listing takes you to a page with it on' do
    
  # end

  # scenario 'doesnt let user list a spcae unless logge in' do
end
