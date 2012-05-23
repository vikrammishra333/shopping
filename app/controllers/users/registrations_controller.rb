class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :load_assets

  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  private

  def load_assets
    AssetManager.include_local_library [:application]
    AssetManager.include_css [:users]
  end
  
end