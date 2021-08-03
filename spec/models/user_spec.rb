require_relative '../../app/lib/user.rb'
require_relative '../helpers/persisted_data.rb'
require 'bcrypt'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Example', email: 'test@example.com', password: 'Password1!')
      persisted_data = persisted_data(table: 'users', user_id: user.user_id)
      expect(user.name).to eq 'Example'
      expect(user.email).to eq 'test@example.com'
      expect(user.user_id).to eq persisted_data[0]['user_id']
    end
    it 'scrambles the password' do
      expect(BCrypt::Password).to receive(:create).with('Password1!')
      User.create(name: 'Example', email: 'test@example.com', password: 'Password1!')
    end
  end

  describe '.authenticate' do
    it 'returns nil given the wrong password' do
      User.create(name: 'Example', email: 'test@example.com', password: 'Password1!')
      expect(User.authenticate(email: 'wrongemail@email.com', password: 'Password1!')).to eq nil
    end
    it 'returns nil given the wrong email' do
      User.create(name: 'Example', email: 'test@example.com', password: 'Password1!')
      expect(User.authenticate(email: 'test@example.com', password: 'wrongPassword1!')).to eq nil
    end
    it 'returns the user given the right email and password' do
      user = User.create(name: 'Example', email: 'test@example.com', password: 'Password1!')
      auth_user = User.authenticate(email: 'test@example.com', password: 'Password1!')

      expect(user.name).to eq auth_user.name
      expect(user.email).to eq auth_user.email
      expect(auth_user.user_id).to eq user.user_id
    end
  end

  describe '.find' do
    it 'finds a user by email' do
      User.create(name: 'Example', email: 'test@example.com', password: 'Password1!')
      expect(User.find(email: 'test@example.com')).to eq true
      expect(User.find(email: 'wrongtest@example.com')).to eq false
    end
  end
end
