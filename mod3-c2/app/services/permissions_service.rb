class PermissionsService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def allow?(controller, action)
    @controller = controller
    @action = action
    case
    when user && user.platform_admin?
      platform_admin_permissions(controller, action)
    else
      guest_user_permissions(controller, action)
    end
  end

  private

  def platform_admin_permissions(controller, action)
    return true if controller == "items"
    return true if controller == "orders"
    return true if controller == "users"
    return true if controller == "stores"
    return true if controller == "sessions"
  end

  def guest_user_permissions(controller, action)
    return true if controller == "stores"
    return true if controller == "sessions"
  end
end
