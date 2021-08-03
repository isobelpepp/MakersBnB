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
