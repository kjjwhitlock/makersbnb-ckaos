require 'BCrypt'

class User
  attr_reader :id, :name, :email, :password

  def initialize(id:, name:, email:)
    @id = id
    @name = name
    @email = email
  end

  def self.create(name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    user = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES ('#{name}', '#{email}', '#{encrypted_password}') RETURNING id, name, email;")
    self.new(id: user[0]['id'], name: user[0]['name'], email: user[0]['email'])
  end

  def self.find(id:)
    user = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    self.new(id: user[0]['id'], name: user[0]['name'], email: user[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = #{email};")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end
end
