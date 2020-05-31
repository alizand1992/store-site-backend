class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :lockable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: WhitelistedJwt

  def whitelisted_jwts
    WhitelistedJwt
  end

  def on_jwt_dispatch(token, payload)
    whitelisted_jwts.create!(
      user_id: self.id,
      jti: payload['jti'],
      aud: payload['aud'],
      exp: Time.at(payload['exp'].to_i)
    )
  end
end
