require 'sinatra/base'
require 'slim'

class Erierb < Sinatra::Base
  get '/' do
    "Hello, World!"
  end

  get '/about' do
    "Hello, World!"
  end

  get '/page' do
    @name = "Ruby"
    slim :page
  end
end
