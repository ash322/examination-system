class User < ApplicationRecord

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_one :test, dependent: :destroy
  has_many :images, as: :record
  #accepts_nested_attributes_for :images, allow_destroy: true
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def has_role?(role_sym)
   roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end
end
