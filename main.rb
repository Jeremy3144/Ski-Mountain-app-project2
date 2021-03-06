require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg' 
require 'pry' if development?

require_relative 'lib'
require_relative 'models/mountain'
require_relative 'models/user'
require_relative 'models/votes'
require_relative 'models/comments'


enable :sessions

get '/' do
  redirect "/login" unless logged_in?
  erb :index
end

get '/login' do
  erb(:login, layout: false)
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
  erb(:new_login, layout: false)
end

post '/login/new' do
  create_user(params[:email], params[:password])
  redirect 'login'
end

delete '/logout' do
  session[:user_id] = nil
  redirect '/login'
end

get '/browse' do
  mountains = get_all_mountains()
  erb(:browse, locals: { mountains: mountains })
end

get '/browse/recent' do
  mountains = get_all_by_id_posted_last()
  erb(:browse, locals: { mountains: mountains })
end

get '/mountain/new' do
  redirect "/login" unless logged_in?
  erb(:mountain_new)
end

post '/mountain/new' do
  create_mountain(
    params[:name_of_mt],
    params[:country],
    params[:sum_of_mt],
    params[:terrain_lvl],
    params[:img_url],
    params[:fav_run],
    session[:user_id]
  )
  redirect "browse"
end

get '/mountain/:id' do
  mountain = get_one_mountain_by_id(params[:id])
  comments = get_comments_by_post_id(params[:id])
  erb(:mountain, locals: {
    mountain: mountain,
    comments: comments
  })
end

get '/mountain/:id/edit' do
  mountain = get_one_mountain_by_id(params[:id])
  erb(:mountain_edit, locals: {mountain: mountain})
end

patch '/mountain/edit' do
  update_mountain(
    params[:id],
    params[:name_of_mt],
    params[:country],
    params[:sum_of_mt],
    params[:terrain_lvl],
    params[:img_url],
    params[:fav_run],
  )
  redirect "/mountain/#{params[:id]}"
end

delete '/mountain' do
  delete_mountain(params[:id])
  redirect '/browse'
end

post '/mountain/vote' do
  if user_voted?(session[:user_id],params[:id])
    redirect "mountain/#{params[:id]}"
  end
  if params[:vote] == "up"
    add_vote(
      session[:user_id],
      params[:id],
      "up"
    )
  else 
    add_vote(
      session[:user_id],
      params[:id],
      "down"
    )
  end
  redirect "/mountain/#{params[:id]}"
end

get '/:no_page' do
  redirect "/"
end

post '/mountain/comment' do
  add_comment(params[:user_id], params[:post_id], params[:comment])
  redirect "/mountain/#{params[:post_id]}"
end






