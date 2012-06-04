# To change this template, choose Tools | Templates
# and open the template in the editor.

module DeviseHelper
  # A simple way to show error messages for the current devise resource. If you need
  # to customize this method, you can either overwrite it in your application helpers or
  # copy the views to your application.
  #
  # This method is intended to stay simple and it is unlikely that we are going to change
  # it to add more behavior or options.
  def devise_error_messages!
    @msg = Hash.new
    return "" if resource.errors.empty?

    resource.errors.each do |key,value|
      @msg[key] = resource.errors[key]
    end
  end
end
