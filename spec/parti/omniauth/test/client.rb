module Parti
  module OmniAuth
    module Test
      module Client
        def self.identifier
          ENV['PARTI_TEST_CLIENT_ID'] or raise 'Missing env PARTI_TEST_CLIENT_ID'
        end

        def self.secret
          ENV['PARTI_TEST_CLIENT_SECRET'] or raise 'Missing env PARTI_TEST_CLIENT_SECRET'
        end
      end
    end
  end
end
