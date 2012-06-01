module ApplicationHelper

  def ensure_admin
    if current_user.check_admin?
      return true
    else
      return false
    end
  end

end
