class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :secret_session, 'reptilecollection'
  end

  get '/' do
    erb :"initial/initial.html"
  end

  post '/' do
    redirect '/login'
  end
end
