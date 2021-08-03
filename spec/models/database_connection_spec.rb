require './app/lib/database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')
      DatabaseConnection.setup('makersbnb_test')
    end
    it 'is a persistent connection' do
      connection = DatabaseConnection.setup('makersbnb_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end
  describe '.query' do
    it 'executes a query' do
      connection = DatabaseConnection.setup('makersbnb_test')
      expect(connection).to receive(:exec).with('SELECT * FROM users;')

      DatabaseConnection.query('SELECT * FROM users;')
    end
  end
end
