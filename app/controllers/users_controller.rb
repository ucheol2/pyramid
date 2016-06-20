class UsersController < ApplicationController

  def index
    @users = User.search

    # This is action multi format render
    # We'll cover it soon
    respond_to do |format|
      format.html
      format.js
    end
  end

end
