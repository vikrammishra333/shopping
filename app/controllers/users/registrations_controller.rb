class Users::RegistrationsController < Devise::RegistrationsController
  include DeviseHelper
  before_filter :load_assets

  def callback
    auth = request.env['omniauth.auth']
    @user = User.check_email(auth)
  end

  private

  def load_assets
    AssetManager.include_local_library [:application, :registration]
    AssetManager.include_css [:application, :users]
  end
  
end