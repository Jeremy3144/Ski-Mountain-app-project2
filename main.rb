require 'sinatra'
require 'sinatra/reloader' 
require 'pg' 
require 'pry'

require_relative 'lib'
require_relative 'models/mountain'
require_relative 'models/user'

enable :sessions

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  user = find_one_user_by_email( params[:email] )

  if user && BCrypt::Password.new(user["password_digest"]) == params[:password]

    session[:user_id] = user['id']

    redirect '/'
  else
    erb :login  
  end
end

get '/login/new' do
  erb :new_login
end

post '/login/new' do
  create_user(params[:email], params[:password])
  redirect 'login'
end





