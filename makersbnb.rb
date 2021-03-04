require 'sinatra/base'
require_relative 'database_connection_setup'
require_relative 'lib/database_connection'
require_relative 'lib/user'
require_relative 'lib/request'
require './lib/space'

class MakersBnb < Sinatra::Base
  before { @user = User.find(id: session[:id]) if session[:id] }

  enable :sessions
  set :session_secret, ENV['SESSION_SECRET']

  get '/' do
    erb :index
  end

  post '/users' do
    name = params[:name]
    email = params[:email]
    password = params[:password]
    user = User.create(name: name, email: email, password: password)
    session[:id]
    session[:id] = user.id
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], host_id:  session[:id])
    session[:id]
    redirect '/spaces'
  end

  get '/spaces/:id' do
    @space = Space.find(id: params[:id])
    erb :'spaces/show'
  end


  post '/requests/:id' do
    Request.create(space_id: params[:id], renter_id: session[:id], date: params[:date], confirmed: 'pending')
    redirect '/requests'
  end

  get '/requests' do
    @requests = Request.all
    erb :'requests/index'
  end

  get '/sessions/new' do
    session[:id]
    @alert = session[:alert]
    erb :'sign_in'
  end

  post '/authenticate' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:id] = user.id
      session[:alert] = nil
      redirect '/spaces'
    else
      session[:alert] = true
      redirect 'sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    redirect '/'
  end

  get '/requests_received' do
    session[:id]
    @owned_spaces = Space.find_by_host_id(host_id: session[:id])
    @requests = @owned_spaces.map {|space| Request.find_by_space_id(space_id: space.id)}.flatten
    erb :requests_received
  end

  post '/requests_received/:request_id' do
    Request.update_availability(status: params[:status], request_id: params[:request_id])
    redirect '/requests_received'
  end

  run! if app_file == $0
end
