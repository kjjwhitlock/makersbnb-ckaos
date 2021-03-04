require 'pg'
require 'rake'

namespace :db do
  namespace :test do
    task :migrate do
      connection = PG.connect(dbname: 'makersbnb_test')
      puts '=== Creating table: users ==='
      connection.exec(
        "CREATE TABLE users (
          id SERIAL PRIMARY KEY,
          name VARCHAR (60),
          email VARCHAR (60) UNIQUE,
          password VARCHAR (60)
        );"
      )
      puts '=== Creating table: spaces ==='
      connection.exec(
        "CREATE TABLE spaces (
          id SERIAL PRIMARY KEY,
          name VARCHAR (60),
          description VARCHAR (500),
          price INTEGER,
          host_id INTEGER
        );"
      )
      puts '=== Creating table: requests ==='
      connection.exec(
        "CREATE TABLE requests (
          id SERIAL PRIMARY KEY,
          space_id INTEGER REFERENCES spaces (id),
          renter_id INTEGER REFERENCES users (id),
          date DATE NOT NULL,
          confirmed VARCHAR (60)
        );"
      )
      connection.exec("ALTER DATABASE makersbnb SET datestyle TO 'ISO, DMY';")
    end
  end
end
