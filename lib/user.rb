class User

  def initialize(id, name, email, password)
    @id = id
    @name = name
    @email = email
    @password = password
  end

  def self.create(name, email, password)
    user = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES (#{name}, #{email}, #{password}) RETURNING *;")
    self.new(user[0]['id'], user[0]['name'], user[0]['email'], user[0]['password'])
  end
end
