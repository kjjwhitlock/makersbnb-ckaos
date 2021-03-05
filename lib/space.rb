require 'date'
require_relative 'database_connection'


class Space
  def self.create(name:, description:, price:, host_id:, start_date:, end_date:)

    result = DatabaseConnection.query("INSERT INTO spaces (name, description, price, host_id, start_date, end_date) VALUES ($$#{name}$$,$$#{description}$$,'#{price}','#{host_id}', '#{start_date}', '#{end_date}') RETURNING id, name, description, price, host_id")
    start_date = DatabaseConnection.query("SELECT to_char(start_date, 'DD/MM/YYYY') FROM spaces WHERE id = #{result[0]['id']};")
    end_date = DatabaseConnection.query("SELECT to_char(end_date, 'DD/MM/YYYY') FROM spaces WHERE id = #{result[0]['id']};")

    Space.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], id: result[0]['id'], host_id: result[0]['host_id'], start_date: start_date[0]['to_char'], end_date: end_date[0]['to_char'] )
  end

  def self.all
     result = DatabaseConnection.query("SELECT * FROM spaces")

     result.map do |space|
       Space.new(name: space['name'], description: space['description'], price: space['price'], id: space['id'], host_id: space['host_id'], start_date: space['start_date'], end_date: space['end_date'])
     end
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM spaces where id = #{id};")
    Space.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], id: result[0]['id'], host_id: result[0]['host_id'], start_date: result[0]['start_date'], end_date: result[0]['end_date'] )
  end


  def self.find_by_host_id(host_id:)
    result = DatabaseConnection.query("SELECT * FROM spaces where host_id = '#{host_id}';")
    result.map do |space|
      Space.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], id: result[0]['id'], host_id: result[0]['host_id'], start_date: result[0]['start_date'], end_date: result[0]['end_date'] )
    end
  end

  attr_reader :name, :description, :price, :id, :host_id, :start_date, :end_date

  def initialize(name:, description:, price:, id:, host_id:, start_date:, end_date:)
    @name = name
    @description = description
    @price = price
    @id = id
    @host_id = host_id
    @start_date = start_date
    @end_date = end_date
    @dates = []
  end

  def start
    date = Date.parse(@start_date)
    date.strftime("%d/%m/%Y")
  end

  def end
    date = Date.parse(@end_date)
    date.strftime("%d/%m/%Y")
  end

  def update_availability(date)
    @dates << date
  end

end
