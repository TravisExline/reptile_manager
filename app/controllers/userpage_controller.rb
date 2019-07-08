class UserPageController < ApplicationController
  get '/userpage' do
     erb :"posts/user_page.html"
  end
end
