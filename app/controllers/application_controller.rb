class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :secret_session, 'reptilecollection'
  end

  get '/' do
    erb :"index"
  end

  helpers do
    def logged_in?
      !!session[:email]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logout
      session.clear
      redirect '/'
    end
  end
end
