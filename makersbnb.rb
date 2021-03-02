require 'sinatra/base'
require_relative 'database_connection_setup'
require_relative 'lib/database_connection'
require_relative 'lib/user'
require './lib/space'

class MakersBnb < Sinatra::Base

  enable :sessions
  set :session_secret, 'ckaos'

  get '/' do
    erb :index
  end

  post '/users' do
    name = params[:name]
    email = params[:email]
    password = params[:password]
    user = User.create(name: name, email: email, password: password)
    session[:id] = user.id
    redirect '/spaces'
  end

  get '/spaces' do
    @user = User.find(id: session[:id])
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
