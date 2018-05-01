class User < ApplicationRecord

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_one :test

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def has_role?(role_sym)
   roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end
end
