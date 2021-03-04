require_relative 'database_connection'

class Space
  def self.create(name:, description:, price:, host_id:)

    result = DatabaseConnection.query("INSERT INTO spaces (name, description, price, host_id) VALUES ($$#{name}$$,$$#{description}$$,'#{price}','#{host_id}') RETURNING id, name, description, price, host_id")
    Space.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], id: result[0]['id'], host_id: result[0]['host_id'])
  end

  def self.all
     result = DatabaseConnection.query("SELECT * FROM spaces")

     result.map do |space|
       Space.new(name: space['name'], description: space['description'], price: space['price'], id: space['id'], host_id: space['host_id'])
     end
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM spaces where id = #{id};")
    Space.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], id: result[0]['id'], host_id: result[0]['host_id'] )
  end


  def self.find_by_host_id(host_id:)
    result = DatabaseConnection.query("SELECT * FROM spaces where host_id = #{host_id};")
    result.map do |space|
      Space.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], id: result[0]['id'], host_id: result[0]['host_id'])
    end
  end
  attr_reader :name, :description, :price, :id, :host_id

  def initialize(name:, description:, price:, id:, host_id:)
    @name = name
    @description = description
    @price = price
    @id = id
    @host_id = host_id
  end
end
