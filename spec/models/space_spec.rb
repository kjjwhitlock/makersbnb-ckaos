require 'space'
require 'database_helper'

describe Space do
EXAMPLE_PRICE = 5
  describe '.create' do
    it 'creates space and adds it to the database' do
      space = Space.create(name: 'Example name', description: 'Example description', price: EXAMPLE_PRICE )
      persisted_data = persisted_data(table: 'spaces', id: space.id)

      expect(space).to be_a Space
      expect(space.name).to eq 'Example name'
      expect(space.describe).to eq 'Example description'
      expect(space.price).to eq 5
      expect(space.id).to eq persisted_data.first['id']

    end
  end

end
