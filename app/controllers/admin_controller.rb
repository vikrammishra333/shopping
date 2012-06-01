class AdminController < ApplicationController

  include ApplicationHelper
  
  before_filter :authenticate_user!
  before_filter :check_admin, :load_assets
  layout :layout_by_resource




  protected

  #defining the layout for admin
  def layout_by_resource
    "admin_layout"
  end



  private

  #loading assets according to requirement
  def load_assets
    AssetManager.include_local_library [:application, :admin_layout_data_table]
    AssetManager.include_css [:application, :admin_layout, :colorbox]
    AssetManager.include_contrib_library [:colorbox]
  end


  #/admin/*
  # To check whether the user is admin or not
  #if not redirect to root url
  def check_admin
    if not ensure_admin
      redirect_to root_url, alert: "you are not authorized"
    end
  end
end