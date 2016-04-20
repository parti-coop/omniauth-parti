require 'rack/oauth2'
require 'parti/omniauth/test/auth_api'
require 'parti/omniauth/test/client'

module Parti
  module OmniAuth
    module Test
      class UsersApi
        attr_reader :client

        def post(path, data)
          client.post users_api_url(path), data
        end

        def client
          Rack::OAuth2::AccessToken::Bearer.new(
            access_token: auth_api.client_credentials_token
          )
        end

        def auth_api
          @auth_api ||= Parti::OmniAuth::Test::AuthApi.new(
            client_id: Client.identifier,
            client_secret: Client.secret
          )
        end

        def users_api_url(path = '/')
          URI.join(users_api_base_url, path).to_s
        end

        def users_api_base_url
          "#{users_api_scheme}://#{users_api_host}#{users_api_port_part}"
        end

        def users_api_port_part
          return '' if users_api_scheme == 'http' && users_api_port == 80
          return '' if users_api_scheme == 'https' && users_api_port == 443
          ":#{users_api_port}"
        end

        def users_api_scheme
          'http'
        end

        def users_api_host
          'v1.api.users.parti.xyz'
        end

        def users_api_port
          80
        end
      end
    end
  end
end
