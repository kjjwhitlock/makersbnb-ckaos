

def setup_database
  connection = PG.connect(dbname: makersbnb_test)
  connection.exec('TRUNCATE spaces;')
end
