class ReptilePostController < ApplicationController
  get '/reptiles' do
    if logged_in?
      @reptiles = Reptile.all
      erb :"reptiles/index"
    else
      redirect '/login'
    end
  end

  get '/reptiles/new' do
    if logged_in?
      erb :'/reptiles/new'
    else
      redirect '/login'
    end
  end

  post '/reptiles' do
    if logged_in?
      if params[:name] && params[:species] == ""
        redirect '/reptiles/new'
      else
        @reptile = Reptile.create(name: params[:name], age: params[:age], species: params[:species], morph: params[:morph], user_id: current_user.id)
        if @reptile.save
          redirect "/reptiles/#{@reptile.id}"
        else
          redirect '/reptiles/new'
        end
      end
    else
      redirect '/login'
    end
  end

  get '/reptiles/:id' do
    if logged_in?
      @reptile = Reptile.find_by_id(params[:id])
      erb :'reptiles/show'
    else
      redirect '/login'
    end
  end

  get '/reptiles/:id/edit' do
    if logged_in?
      @reptile = Reptile.find_by_id(params[:id])
      if @reptile && @reptile.user == current_user
        erb :'reptile/show'
      else
        redirect '/reptiles'
      end
    else
      redirect 'login'
    end
  end

  patch '/reptiles/:id' do
    if logged_in?
      if params[:content] == ""
        redirect "/reptile/#{params[:id]}/edit"
      else
        @reptile = Reptile.find_by_id(params[:id])
        if @reptile && @reptile.user == current_user
          if @reptile.update(content: params[:content])
            redirect to "/reptiles/#{@reptile.id}"
          else
            redirect to "/reptiles/#{@reptile.id}/edit"
          end
        else
          redirect to '/reptiles'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/reptiles/:id/delete' do
    if logged_in?
      @reptile = Reptile.find_by_id(params[:id])
      if @reptile && @reptile.user == current_user
        @reptile.delete
      end
      redirect to '/reptiles'
    else
      redirect to '/login'
    end
  end
end
