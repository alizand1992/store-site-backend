class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Whitelist
  # Include default devise modules. Others available are:
  # :confirmable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :lockable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: WhitelistedJwt
end
