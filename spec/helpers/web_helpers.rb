def log_in
  visit('/log_in')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'Password1!')
  click_button('Log In')
end

def sign_up
  visit('/')
  fill_in('name', with: 'Test')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'Password1!')
  click_button('Sign Up')
end

def create_listing
  visit('/listings')
  click_button('Add Listing')
  fill_in('name', with: 'Izzys Igloo')
  fill_in('description', with: 'Cold and icy')
  fill_in('price', with: 50)
  click_button('List My Space')
end
