EXAMPLE_HOST_ID = 1

describe 'request' do
  describe '.create' do
    it 'creates a request with the space and renter ids' do
      renter = User.create(name: 'Test', email: 'test@test.com', password: 'pw123')
      space = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID)

      request = Request.create(space_id: space.id, renter_id: renter.id)
      persisted_data = persisted_data(table: 'requests', id: request.id)
      expect(request.renter_id).to eq renter.id
      expect(request.space_id).to eq space.id
      expect(request.id).to eq persisted_data[0]['id']
    end
  end

  describe '.all' do
    it 'retrieves all requests' do
      renter = User.create(name: 'Test', email: 'test@test.com', password: 'pw123')
      space = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID)
      request1 = Request.create(space_id: space.id, renter_id: renter.id)
      request2 = Request.create(space_id: space.id, renter_id: renter.id)
      request3 = Request.create(space_id: space.id, renter_id: renter.id)

      requests = Request.all
      persisted_data = persisted_data(table: 'requests', id: request1.id)

      expect(requests.length).to eq 3
      expect(requests.first.space_id).to eq request1.space_id
      expect(requests.first.id).to eq persisted_data.first['id']
    end
  end

  describe '#space' do
    it 'returns information about the space relevant to the request' do
      renter = User.create(name: 'Test', email: 'test@test.com', password: 'pw123')
      space = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID)
      request = Request.create(space_id: space.id, renter_id: renter.id)

      expect(request.space.name).to eq space.name
    end
  end

  describe '.find_by_space_id' do
    it 'returns requests based on space_id' do
      renter = User.create(name: 'Test', email: 'test@test.com', password: 'pw123')
      space1 = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID)
      space2 = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID)
      request1 = Request.create(space_id: space1.id, renter_id: renter.id)
      request2 = Request.create(space_id: space2.id, renter_id: renter.id)
      request3 = Request.create(space_id: space1.id, renter_id: renter.id)
      spaced_requests = Request.find_by_space_id(space_id: space1.id)
      expect(spaced_requests.length).to eq 2
    end
  end
end
