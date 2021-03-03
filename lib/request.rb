class Request
  attr_reader :id, :space_id, :renter_id

  def self.create(space_id:, renter_id:)
    row = DatabaseConnection.query("INSERT INTO requests (space_id, renter_id)
    VALUES (#{space_id}, #{renter_id}) RETURNING *;")
    new(id: row[0]['id'], space_id: row[0]['space_id'], renter_id: row[0]['renter_id'])
  end

  def initialize(id:, space_id:, renter_id:)
    @id = id
    @space_id = space_id
    @renter_id = renter_id
  end
end
