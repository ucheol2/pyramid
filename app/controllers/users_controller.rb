class UsersController < ApplicationController

  def index
    @users = User.search.paginate(page: params[:page])

    # This is action multi format render
    # We'll cover it soon
    respond_to do |format|
      format.html
      format.js
    end
  end

end
