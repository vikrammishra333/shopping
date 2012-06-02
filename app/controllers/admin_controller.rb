=begin
  @File Name     :- admin_controller.rb
  @Create By     :- Vikram Kumar Mishra(Mindfire Solutions)
  @Date Created  :- 2012-05-28
  @Date Modified :-
  @purpose       :- To Handle Admin Part of the application. It works as a gateway to admin.
                    Here the user will be authenticated first and then checked whether he/she
                    is having admin access.
=end

class AdminController < ApplicationController

  #include application_helper.rb
  include ApplicationHelper

  #Authenticate the user
  before_filter :authenticate_user!

  #Authorize the user and load the assets used for the admin part.
  before_filter :check_admin, :load_assets

  #Declare the layout to display
  layout :layout_by_resource




  protected

  #defining the layout for admin
  def layout_by_resource
    "admin_layout"
  end # end method



  private

  #loading assets according to requirement
  def load_assets
    AssetManager.include_local_library [:application, :admin_layout_data_table]
    AssetManager.include_css [:application, :admin_layout, :colorbox]
    AssetManager.include_contrib_library [:colorbox]
  end # end method


  #/admin/*
  # To check whether the user is admin or not
  #if not redirect to root url
  def check_admin
    if not ensure_admin
      redirect_to root_url, alert: "you are not authorized"
    end # end if
  end # end method

end # end class