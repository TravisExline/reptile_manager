class PostsController < ApplicationController
  get '/posts' do
    erb :"posts/public_posts.html"
  end

  post '/public' do
    redirect '/posts'
  end
end
