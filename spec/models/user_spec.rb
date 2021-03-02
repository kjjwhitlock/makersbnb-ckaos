require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'name', email: 'email', password: 'password')
      expect(user.name).to eq('name')
      expect(user.email).to eq('email')
      expect(user.password).to eq('password')
    end
  end
end
