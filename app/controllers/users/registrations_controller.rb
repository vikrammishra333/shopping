class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :load_js

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

  def load_js
    
  end
  
end