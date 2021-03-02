describe DatabaseConnection do
  describe '.setup' do
    it 'calls connect on PG' do
      expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')
      described_class.setup(dbname: 'makersbnb_test')
    end
  end

  describe '.query' do
    it 'calls a query on the connection from .setup' do
      connection = described_class.setup(dbname: 'makersbnb_test')
      expect(connection).to receive(:exec).with('SELECT * FROM users;')
      described_class.query('SELECT * FROM users;')
    end
  end
end
