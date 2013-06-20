require 'sinatra/base'

class Erierb < Sinatra::Base
  get '/' do
    "Hello, World!"
  end
end
