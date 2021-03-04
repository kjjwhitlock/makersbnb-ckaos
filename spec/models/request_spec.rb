describe 'request' do
  describe '.create' do
    it 'creates a request with the space and renter ids' do
      renter = User.create(name: 'Test', email: 'test@test.com', password: 'pw123')
      space = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID, start_date: EXAMPLE_START_DATE, end_date: EXAMPLE_END_DATE)
      request = Request.create(space_id: space.id, renter_id: renter.id, date: '01/01/2022', confirmed: 'pending')
      persisted_data = persisted_data(table: 'requests', id: request.id)

      expect(request.renter_id).to eq renter.id
      expect(request.space_id).to eq space.id
      expect(request.id).to eq persisted_data[0]['id']
    end
  end

  describe '.all' do
    it 'retrieves all requests' do
      renter = User.create(name: 'Test', email: 'test@test.com', password: 'pw123')
      space = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID, start_date: EXAMPLE_START_DATE, end_date: EXAMPLE_END_DATE)
      request1 = Request.create(space_id: space.id, renter_id: renter.id, date: '01/01/2022', confirmed: 'pending')
      request2 = Request.create(space_id: space.id, renter_id: renter.id, date: '01/01/2022', confirmed: 'pending')
      request3 = Request.create(space_id: space.id, renter_id: renter.id, date: '01/01/2022', confirmed: 'pending')
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
      space = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID, start_date: EXAMPLE_START_DATE, end_date: EXAMPLE_END_DATE)
      request = Request.create(space_id: space.id, renter_id: renter.id, date: '01/01/2022', confirmed: 'pending')
      expect(request.space.name).to eq space.name
    end
  end
  describe 'date' do
    it 'returns the date of the booking' do
      renter = User.create(name: 'Test', email: 'test@test.com', password: 'pw123')
      space = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID, start_date: EXAMPLE_START_DATE, end_date: EXAMPLE_END_DATE)
      request = Request.create(space_id: space.id, renter_id: renter.id, date: '01/01/2022', confirmed: 'pending')
      persisted_data = persisted_data(table: 'requests', id: request.id)

      expect(request.date).to eq '01/01/2022'
      expect(request.id).to eq persisted_data.first['id']
      expect(request.space_id).to eq persisted_data.first['space_id']
      expect(request.renter_id).to eq persisted_data.first['renter_id']
    end
  end
  describe '.find_by_space_id' do
    it 'returns requests based on space_id' do
      renter = User.create(name: 'Test', email: 'test@test.com', password: 'pw123')
      space1 = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID, start_date: EXAMPLE_START_DATE, end_date: EXAMPLE_END_DATE)
      space2 = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID, start_date: EXAMPLE_START_DATE, end_date: EXAMPLE_END_DATE)
      request1 = Request.create(space_id: space1.id, renter_id: renter.id, date: '01/01/2022', confirmed: 'pending')
      request2 = Request.create(space_id: space2.id, renter_id: renter.id, date: '01/01/2022', confirmed: 'pending')
      request3 = Request.create(space_id: space1.id, renter_id: renter.id, date: '01/01/2022', confirmed: 'pending')
      spaced_requests = Request.find_by_space_id(space_id: space1.id)
      expect(spaced_requests.length).to eq 2
    end
  end

  describe '.find_by_renter_id' do
    it 'returns requests based on renter_id' do
      renter1 = User.create(name: 'Test1', email: 'test1@test.com', password: 'pw123')
      renter2 = User.create(name: 'Test2', email: 'test2@test.com', password: 'pw123')
      space1 = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID, start_date: EXAMPLE_START_DATE, end_date: EXAMPLE_END_DATE)
      space2 = Space.create(name: 'Space', description: 'Great Place!', price: 100, host_id: EXAMPLE_HOST_ID, start_date: EXAMPLE_START_DATE, end_date: EXAMPLE_END_DATE)
      request1 = Request.create(space_id: space1.id, renter_id: renter1.id, date: '01/01/2022', confirmed: 'pending')
      request2 = Request.create(space_id: space2.id, renter_id: renter2.id, date: '01/01/2022', confirmed: 'pending')
      p renter1.id
      request = Request.find_by_renter_id(renter_id: renter1.id)

      expect(request.first.id).to eq request1.id
      expect(request.first.space_id).to eq space1.id
      expect(request.first.renter_id).to eq renter1.id
    end
  end
end
