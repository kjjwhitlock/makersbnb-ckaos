require 'sinatra/base'
require_relative 'database_connection_setup'
require './lib/user'

class MakersBnb < Sinatra::Base
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
end
