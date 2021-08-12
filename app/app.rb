require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'pg'
require_relative './lib/user.rb'
require_relative './lib/listing.rb'
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
    if User.find(email: params[:email]) == false
      flash[:notice] = "We don't recognise that email, please either try again or sign up"
      redirect '/log_in'
    elsif session[:user]
      flash[:notice] = 'Please log out before you can log in'
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
    @listings = Listing.all
    erb :'listings/index'
  end

  post '/listings' do
    Listing.create(name: params[:name], description: params[:description],
                   price: params[:price], user_id: session[:user].user_id)
    redirect '/listings'
  end

  get '/listmyspace' do
    unless session[:user]
      flash[:notice] = 'You must be logged in to do that.'
      redirect '/log_in'
    end

    erb :'listings/list_my_space'
  end

  get '/listings/:listing_id' do
    @listing = Listing.find(listing_id: params[:listing_id])
    erb :'listings/book'
  end

  run! if app_file == $0
end
