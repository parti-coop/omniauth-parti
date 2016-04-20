require 'omniauth-openid-connect'
require 'parti_auth/id_token'

module OmniAuth::Strategies
  class Parti < OpenIDConnect
    option :discovery, true
    option :issuer, 'https://v1.api.auth.parti.xyz'
    option :name, 'parti'
    option :scope, [:openid, :email]
    option :skip_info, true

    uid { id_info.sub }

    alias_method :_call, :call

    def call(env)
      env['omniauth.strategy'] = self
      _call(env)
    end

    def id_info
      @id_info ||= lambda {
        id_token = credentials[:id_token]
        ::PartiAuth::IdToken.decode(id_token, public_key)
      }.call
    end
  end
end
