require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'name', email: 'email', password: 'password')
      expect(user.name).to eq('name')
      expect(user.email).to eq('email')
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

  describe '.authenticate' do
    it 'happy path: valid email and password' do
      user = User.create(name: 'name', email: 'email', password: 'password')
      authenticated_user = User.authenticate(email: 'email', password: 'password')
      expect(user.email).to eq(authenticated_user.email)
      expect(user.id).to eq(authenticated_user.id)
      expect(user.name).to eq(authenticated_user.name)
    end
  end
end
