require 'sinatra/base'
require 'slim'

class User
  attr_accessor :name, :email, :role

  def initialize(params)
    puts params.inspect
    @name = params[:name]
    @email = params[:email]
    @role = params[:role]
  end
end

class UserRepository
  @@users = []

  def initialize
  end

  def self.all
    @@users
  end

  def self.create(user)
    @@users << user
  end
end

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

  get '/users' do
    @users = UserRepository.all
    slim :users
  end

  get '/users/new' do
    slim :users_new
  end

  post '/users' do
    @user = User.new(params[:user])
    UserRepository.create @user
    redirect '/users'
  end
end
