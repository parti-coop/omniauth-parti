require 'omniauth-openid-connect'

module OmniAuth::Strategies
  class Parti < OpenIDConnect
    option :discovery, true
    option :issuer, 'https://v1.api.parti.xyz'
    option :name, 'parti'
    option :skip_info, true
  end
end

