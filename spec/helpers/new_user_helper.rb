def new_user
  User.create(name: 'Test', email: 'test@example.co.uk', password: 'Password1!')
end
