class PostsController < ApplicationController
  get '/posts' do
    if logged_in?
      @posts = Post.all
      # erb :"posts/public_posts.html"
    else
      redirect '/login'
    end
  end

  get '/posts/new' do
    if logged_in?
      erb :'/posts/create_post'
    else
      redirect '/login'
    end
  end

  post '/posts' do
    if logged_in?
      if params[:content] == ""
        redirect '/posts/new'
      else
        @post = current_user.posts.build(content: params[:content])
        if @post.save
          redirect "/posts/#{@post.id}"
        else
          redirect '/posts/new'
        end
      end
    else
      redirect '/login'
    end
  end

  get '/posts/:id' do
    if logged_in?
      @post = Post.find_by_id(params[:id])
      erb :'posts/show_post'
    else
      redirect '/login'
    end
  end

  get '/posts/:id/edit' do
    if logged_in?
      @post = Post.find_by_id(params[:id])
      if @post && @post.user == current_user
        erb :'post/show_post'
      else
        redirect '/posts'
      end
    else
      redirect 'login'
    end
  end

  patch '/posts/:id' do
    if logged_in?
      if params[:content] == ""
        redirect "/post/#{params[:id]}/edit"
      else
        @post = Post.find_by_id(params[:id])
        if @post && @post.user == current_user
          if @post.update(content: params[:content])
            redirect to "/posts/#{@post.id}"
          else
            redirect to "/posts/#{@post.id}/edit"
          end
        else
          redirect to '/posts'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/posts/:id/delete' do
    if logged_in?
      @post = Post.find_by_id(params[:id])
      if @post && @post.user == current_user
        @post.delete
      end
      redirect to '/posts'
    else
      redirect to '/login'
    end
  end
end
