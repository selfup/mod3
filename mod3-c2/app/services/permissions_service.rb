class PermissionsService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def allow?(controller, action)
    true
  end
end
