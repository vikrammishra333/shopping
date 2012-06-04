module ApplicationHelper

  def ensure_admin
    if current_user.check_admin?
      return true
    else
      return false
    end
  end

  def customize_error_message(current_model)
    @msg = Hash.new
    return "" if current_model.errors.empty?
    
    current_model.errors.each do |k,v|
      @msg[k] = current_model.errors[k]
    end

  end

end
