require 'sinatra/base'
require_relative 'database_connection_setup'

class MakersBnb < Sinatra::Base

  get '/' do
    'hello world!!!'
  end

  # run! makersbnb
end
