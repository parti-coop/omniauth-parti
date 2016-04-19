require 'omniauth-openid-connect'

module OmniAuth::Strategies
  class Parti < OpenIDConnect
    option :discovery, true
    option :issuer, 'https://v1.api.auth.parti.xyz'
    option :name, 'parti'
    option :scope, [:openid, :email]
    option :skip_info, true
  end
end

