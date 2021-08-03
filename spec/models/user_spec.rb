require_relative '../../app/lib/user.rb'
require_relative '../helpers/persisted_data.rb'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Example', email: 'test@example.com', password: 'Password1!')
      persisted_data = persisted_data(table: 'users', user_id: user.user_id)
      expect(user.name).to eq 'Example'
      expect(user.email).to eq 'test@example.com'
      expect(user.user_id).to eq persisted_data[0]['user_id']
    end
  end
end
