class UsersController < ApplicationController

  def index
    @users = User.search
  end

end
