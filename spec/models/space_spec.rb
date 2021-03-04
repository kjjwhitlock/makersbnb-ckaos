require 'space'
require 'database_helper'

describe Space do
EXAMPLE_PRICE = "5"
EXAMPLE_HOST_ID = "1"
  describe '.create' do
    it 'creates space and adds it to the database' do
      space = Space.create(name: 'Example name', description: 'Example description', price: EXAMPLE_PRICE, host_id: EXAMPLE_HOST_ID )
      persisted_data = persisted_data(table: 'spaces', id: space.id)

      expect(space).to be_a Space
      expect(space.name).to eq 'Example name'
      expect(space.description).to eq 'Example description'
      expect(space.price).to eq EXAMPLE_PRICE
      expect(space.id).to eq persisted_data.first['id']

    end
  end

  describe '.all' do
    it 'shows all spaces' do
      Space.create(name: 'Example name 1', description: 'Example description 1', price: EXAMPLE_PRICE, host_id: EXAMPLE_HOST_ID  )
      Space.create(name: 'Example name 2', description: 'Example description 1', price: EXAMPLE_PRICE, host_id: EXAMPLE_HOST_ID )
      Space.create(name: 'Example name 3', description: 'Example description 1', price: EXAMPLE_PRICE, host_id: EXAMPLE_HOST_ID )

      spaces = Space.all

      expect(spaces.length).to eq 3
      expect(spaces.first).to be_a Space
      expect(spaces.first.name).to eq 'Example name 1'
      expect(spaces.first.description).to eq 'Example description 1'
      expect(spaces.first.price).to eq EXAMPLE_PRICE
    end
  end

  describe '.find' do
    it 'finds and returns a Space with the space id' do
      space = Space.create(name: 'Example name 1', description: 'Example description 1', price: EXAMPLE_PRICE, host_id: EXAMPLE_HOST_ID )
      space2 = Space.find(id: space.id)

      expect(space2).to be_a Space
      expect(space2.name).to eq 'Example name 1'
      expect(space2.description).to eq 'Example description 1'
      expect(space2.price).to eq EXAMPLE_PRICE
    end
  end

  describe '.find_by_host_id' do
    it 'finds and returns a Space with the host_id' do
      space = Space.create(name: 'Example name 1', description: 'Example description 1', price: EXAMPLE_PRICE, host_id: EXAMPLE_HOST_ID )
      space2 = Space.find_by_host_id(host_id: EXAMPLE_HOST_ID)

      expect(space2[0]).to be_a Space
      expect(space2[0].name).to eq 'Example name 1'
      expect(space2[0].description).to eq 'Example description 1'
      expect(space2[0].price).to eq EXAMPLE_PRICE
      expect(space2[0].host_id).to eq EXAMPLE_HOST_ID
    end
  end


end
