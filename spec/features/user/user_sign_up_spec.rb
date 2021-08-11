require_relative '../../helpers/web_helpers.rb'

feature 'A user can sign up' do
  scenario 'Welcomes user on listings page once signed up' do
    sign_up
    expect(current_path).to eq('/listings')
    expect(page).to have_content 'Welcome Test!'
  end
  scenario "Doesn't let a user sign up with an email already in the system" do
    sign_up
    click_button('Log Out')
    sign_up
    expect(page).to have_content 'We already have that email in our system, please log in'
  end
end
