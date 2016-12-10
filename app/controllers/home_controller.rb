class HomeController < ApplicationController
  def index
    users = User.all.limit(2)
    @admin = users.first
    @user  = users.second
  end
end
