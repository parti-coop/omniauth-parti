require 'omniauth/parti/version'
require 'omniauth/strategies/parti'
require 'parti_auth/account'
require 'parti_auth/exceptions'
require 'parti_auth/id_token'
require 'parti_auth/concern/authentication'

SWD.url_builder = WebFinger.url_builder = URI::HTTP
