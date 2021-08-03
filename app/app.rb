require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'pg'
require_relative './lib/user.rb'
require_relative 'setup_database_connection.rb'


class MakersBnB < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/sign_up' do
    if User.find(email: params[:email]) == true
      flash[:notice] = 'We already have that email in our system, please log in'
      redirect('/')
    end
    session[:user] = User.create(name: params[:name], email: params[:email], password: params[:password])
    flash[:notice] = "Welcome #{session[:user].name}!"
    redirect '/listings'
  end

  get '/log_in' do
    erb :'user/log_in'
  end

  post '/log_in' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if session[:user]
      flash[:notice] = "Please log out before you can log in"
      redirect '/log_in'
    elsif user
      session[:user] = user
    end
    flash[:notice] = "Welcome #{session[:user].name}!"
    redirect '/listings'
  end

  get '/log_out' do
    session.clear
    flash[:notice] = 'You have logged out.'
    redirect '/'
  end

  get '/listings' do
    erb :'listings/index'
  end


  run! if app_file == $0
end
