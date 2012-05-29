class BuyController < ApplicationController

  before_filter :load_assets



  private

  def load_assets
    AssetManager.include_local_library [:application]
    AssetManager.include_css [:application, :users]
  end


end
