require 'sinatra/base'
require_relative 'database_connection_setup'

class MakersBnb < Sinatra::Base

  get '/' do
    'hello world!!!'
  end

  get '/spaces' do
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    redirect '/spaces'
  end

  run! if app_file == $0

end
