require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/listings' do
    @name = params[:name]
    "Welcome #{name}"
  end

  run! if app_file == $0
end
