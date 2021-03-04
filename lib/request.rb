class Request
  attr_reader :id, :space_id, :renter_id, :confirmed

  def self.create(space_id:, renter_id:, confirmed:)
    row = DatabaseConnection.query("INSERT INTO requests (space_id, renter_id, confirmed)
    VALUES (#{space_id}, #{renter_id}, '#{confirmed}') RETURNING *;")
    new(id: row[0]['id'], space_id: row[0]['space_id'], renter_id: row[0]['renter_id'], confirmed: row[0]['confirmed'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM requests;")
    result.map do |request|
      Request.new(
        id: request['id'],
        space_id: request['space_id'],
        renter_id: request['renter_id'],
        confirmed: request['confirmed']
      )
    end
  end

  def initialize(id:, space_id:, renter_id:, confirmed:)
    @id = id
    @space_id = space_id
    @renter_id = renter_id
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

  #Request.update_avalibility(id:, confirmed:)
  #result = DataConnection.query("UPDATE confirmed where if = #{id}")
  #end
  def self.update_availability(status:,request_id:)
    result = DatabaseConnection.query("UPDATE requests SET confirmed='#{status}' WHERE id='#{request_id}';")
  end
end
