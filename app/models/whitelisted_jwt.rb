class WhitelistedJwt < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Whitelist
end
