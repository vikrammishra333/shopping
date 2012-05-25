class UsersController < ApplicationController


  def callback
    @user = request.env['omniauth.auth']
  end

end
