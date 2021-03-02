require 'sinatra/base'
require_relative 'database_connection_setup'
require_relative 'lib/database_connection'
require_relative 'lib/user'

class MakersBnb < Sinatra::Base

  enable :sessions

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
    erb :'spaces/index'
  end
end
