class Role < ActiveRecord::Base
  has_many :user_roles
  has_many :users, through: :user_roles

  def platform_admin?
    roles.exist?(name: "platform_admin")
  end

  def store_admin?
    roles.exist?(name: "store_admin")
  end

  def registered_user?
    roles.exist?(name: "registered_user")
  end
end
