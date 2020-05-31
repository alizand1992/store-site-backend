# frozen_string_literal: true

require 'active_support/concern'

class WhitelistedJwt < ApplicationRecord
  extend ActiveSupport::Concern

  # @see Warden::JWTAuth::Interfaces::RevocationStrategy#jwt_revoked?
  def self.jwt_revoked?(payload, user)
    !user.whitelisted_jwts.exists?(payload.slice('jti', 'aud'))
  end

  # @see Warden::JWTAuth::Interfaces::RevocationStrategy#revoke_jwt
  def self.revoke_jwt(payload, user)
    jwt = user.whitelisted_jwts.find_by(payload.slice('jti', 'aud'))
    jwt.destroy! if jwt
  end
end

