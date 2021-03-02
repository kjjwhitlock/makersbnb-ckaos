require './lib/database_connection'

def setup_database
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup(dbname: 'makersbnb_test')
    p "=|=|= ckaos loading ... database = #{dbname} =|=|="
  else
    DatabaseConnection.setup(dbname: 'makersbnb')
    p "=|=|= ckaos loading ... database = #{dbname} =|=|="
  end
end