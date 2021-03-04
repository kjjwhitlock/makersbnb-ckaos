class Request
  attr_reader :id, :space_id, :renter_id, :date

  def self.create(space_id:, renter_id:, date:)
    row = DatabaseConnection.query("INSERT INTO requests (space_id, renter_id, date)
    VALUES (#{space_id}, #{renter_id}, '#{date}')
    RETURNING id, space_id, renter_id, TO_CHAR(date, 'DD/MM/YYYY');")

    new(id: row[0]['id'], space_id: row[0]['space_id'],
      renter_id: row[0]['renter_id'], date: row[0]['to_char'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT id, space_id, renter_id,
      TO_CHAR(date, 'DD/MM/YYYY') FROM requests;")

    result.map do |request|
      Request.new(
        id: request['id'],
        space_id: request['space_id'],
        renter_id: request['renter_id'],
        date: request['to_char']
      )
    end
  end

  def initialize(id:, space_id:, renter_id:, date:)
    @id = id
    @space_id = space_id
    @renter_id = renter_id
    @date = date
  end

  def space(space_class = Space)
    space_class.find(id: space_id)
  end
end
