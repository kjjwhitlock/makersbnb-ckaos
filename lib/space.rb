require_relative 'database_connection'

class Space
  def self.create(name:, description:, price:)
    result = DatabaseConnection.query("INSERT INTO spaces (name, description, price) VALUES ('#{name}','#{description}','#{price}') RETURNING id, name, description, price")
    Space.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], id: result[0]['id'])
  end

  def self.all
     result = DatabaseConnection.query("SELECT * FROM spaces")
     result.map do |space| 
       Space.new(name: space['name'], description: space['description'], price: space['price'], id: space['id'])
     end
  end

  attr_reader :name, :description, :price, :id

  def initialize(name:, description:, price:, id:)
    @name = name
    @description = description
    @price = price
    @id = id
  end
end
