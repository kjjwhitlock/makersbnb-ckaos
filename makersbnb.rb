require 'sinatra/base'
require_relative 'database_connection_setup'
require './lib/space'

class MakersBnb < Sinatra::Base

  get '/' do
    'hello world!!!'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/spaces'
  end

  run! if app_file == $0

end
