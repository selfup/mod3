class PermissionsService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def allow?(controller, action)
    return true if controller == "stores"
    return true if controller == "sessions"
  end
end
