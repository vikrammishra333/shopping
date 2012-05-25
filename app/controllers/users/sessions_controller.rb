class Users::SessionsController < Devise::SessionsController
  before_filter :load_assets

  def new
    super
  end

  def create
    #super
    @user = request.env['omniauth.auth']
  end

  def destroy
    super
  end

  private

  def load_assets
    AssetManager.include_local_library [:application]
    AssetManager.include_css [:application, :users]
  end

end