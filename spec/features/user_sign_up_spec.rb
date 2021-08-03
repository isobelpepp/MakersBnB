feature 'A user can sign up' do
  scenario 'Welcomes user on listings page once signed up' do
    visit('/')
    fill_in('name', with: 'Example')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'Password1!')
    click_button('Sign In')

    expect(current_path).to eq('/listings')
    expect(page).to have_content 'Welcome Example!'
  end
end
