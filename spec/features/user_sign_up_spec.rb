require_relative '../helpers/web_helpers.rb'

feature 'A user can sign up' do
  scenario 'Welcomes user on listings page once signed up' do
    sign_up
    expect(current_path).to eq('/listings')
    expect(page).to have_content 'Welcome Test!'
  end
end
