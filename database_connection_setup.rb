require './lib/database_connection'


  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup(dbname: 'makersbnb_test')
    p "=|=|= ckaos loading ... database = 'makersbnb_test' =|=|="
  else
    DatabaseConnection.setup(dbname: 'makersbnb')
    p "=|=|= ckaos loading ... database = 'makersbnb' =|=|="
  end
