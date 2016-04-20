require 'omniauth-openid-connect'

module OmniAuth::Strategies
  class Parti < OpenIDConnect
    option :discovery, true
    option :issuer, 'https://v1.api.auth.parti.xyz'
    option :name, 'parti'
    option :scope, [:openid, :email]
    option :skip_info, true

    uid { id_info.sub }

    def id_info
      @id_info ||= lambda {
        id_token = credentials[:id_token]
        ::OpenIDConnect::ResponseObject::IdToken.decode(id_token, public_key)
      }.call
    end
  end
end
