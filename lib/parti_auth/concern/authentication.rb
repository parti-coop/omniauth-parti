require 'parti_auth/account'
require 'parti_auth/id_token'
require 'parti_auth/exceptions'

module PartiAuth
  module Concern
    module Authentication
      extend ActiveSupport::Concern

      def authenticate_account
        redirect_to '/auth/parti' unless session[:id_token]
      end

      def current_account
        raise PartiAuth::Unauthorized unless session[:id_token]
        account_attrs = { id_token: session[:id_token] }
        account_attrs[:access_token] = session[:access_token] if session[:access_token]
        omni_parti = request.env['omniauth.strategy']
        id_info = PartiAuth::IdToken.decode(
          account_attrs[:id_token],
          omni_parti.public_key
        )
        account_attrs[:id_info] = id_info
        PartiAuth::Account.new account_attrs
      end

      def account_signed_in?
        session[:id_token].present?
      end
    end
  end
end
