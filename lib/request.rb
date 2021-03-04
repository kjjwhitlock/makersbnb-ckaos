class Request
  attr_reader :id, :space_id, :renter_id, :date, :confirmed

  def self.create(space_id:, renter_id:, date:, confirmed:)
    row = DatabaseConnection.query("INSERT INTO requests (space_id, renter_id, date, confirmed)
    VALUES (#{space_id}, #{renter_id}, '#{date}', '#{confirmed}')
    RETURNING id, space_id, renter_id, TO_CHAR(date, 'DD/MM/YYYY'), confirmed;")

    new(id: row[0]['id'], space_id: row[0]['space_id'], renter_id: row[0]['renter_id'], date: row[0]['to_char'], confirimed: row[0]['confirmed'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT id, space_id, renter_id,
      TO_CHAR(date, 'DD/MM/YYYY') FROM requests;")

    result.map do |request|
      Request.new(
        id: request['id'],
        space_id: request['space_id'],
        renter_id: request['renter_id'],
        date: request['to_char'],
        confirmed: request['confirmed']
      )
    end
  end

  def initialize(id:, space_id:, renter_id:, date:, confirmed:)
    @id = id
    @space_id = space_id
    @renter_id = renter_id
    @date = date
    @confirmed = confirmed
  end

  def space(space_class = Space)
    space_class.find(id: space_id)
  end

  def self.find_by_space_id(space_id:)
    result = DatabaseConnection.query("SELECT * FROM requests WHERE space_id = #{space_id};")
    result.map do |request|
      Request.new(
        id: request['id'],
        space_id: request['space_id'],
        renter_id: request['renter_id'],
        confirmed: request['confirmed']
      )
    end
  end

  def self.update_availability(status:,request_id:)
    result = DatabaseConnection.query("UPDATE requests SET confirmed='#{status}' WHERE id='#{request_id}';")
  end
end
