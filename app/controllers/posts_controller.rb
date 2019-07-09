class PostsController < ApplicationController
  get '/posts' do
    "You are logged in as #{session[:email]}"
    # erb :"posts/public_posts.html"
  end

  get '/posts/new' do
    if !logged_in?
      redirect "/login"
    else
      "A new post form here"
    end
  end

  post '/public' do
    redirect '/posts'
  end
end
