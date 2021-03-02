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

  describe '.find' do
    it 'finds a user' do
      user = User.create(name: 'name', email: 'email', password: 'password')
      user2 = User.find(id: user.id)
      expect(user2.name).to eq(user.name)
      expect(user2.id).to eq(user.id)
      expect(user2.email).to eq(user.email)
    end
  end
end
