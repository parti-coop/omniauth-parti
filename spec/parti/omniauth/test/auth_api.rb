require 'rack/oauth2'

module Parti
  module OmniAuth
    module Test
      class AuthApi
        attr_reader :client_id, :client_secret, :scopes

        def initialize(client_id:, client_secret:, scopes: [])
          @client_id = client_id
          @client_secret = client_secret
          @scopes = scopes
        end

        def post(path, data, *rest)
          token_client.post auth_api_url(path), data, *rest
        end

        def token_client
          Rack::OAuth2::AccessToken::Bearer.new(
            access_token: access_token
          )
        end

        def access_token
          client_credentials_token
        end

        def client_credentials_token
          oauth2_client.access_token! scope: scopes.join(' ')
        end

        def oauth2_client(scopes = [])
          Rack::OAuth2::Client.new(
            host: auth_api_host,
            identifier: client_id,
            secret: client_secret,
            token_endpoint: token_endpoint
          )
        end

        def token_endpoint
          auth_api_url '/v1/tokens'
        end

        def auth_api_url(path = '/')
          URI.join(auth_api_base_url, path).to_s
        end

        def auth_api_base_url
          "#{auth_api_scheme}://#{auth_api_host}#{auth_api_port_part}"
        end

        def auth_api_port_part
          return '' if auth_api_scheme == 'http' && auth_api_port == 80
          return '' if auth_api_scheme == 'https' && auth_api_port == 443
          ":#{auth_api_port}"
        end

        def auth_api_scheme
          'http'
        end

        def auth_api_host
          'v1.api.auth.parti.xyz'
        end

        def auth_api_port
          80
        end
      end
    end
  end
end
