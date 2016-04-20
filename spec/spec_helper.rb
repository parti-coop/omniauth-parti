$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'byebug'
require 'omniauth/parti'

Dir[__dir__ + '/support/**/*.rb'].each { |f| require f }
