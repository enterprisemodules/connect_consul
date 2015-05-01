require 'connect/datasources/base'
require 'method_hash'
require 'hash_extensions'
begin
  require 'diplomat'
rescue LoadError
end


module Connect
  module Datasources
    ##
    #
    # The base class for Consul data sources
    #
    #
    class ConsulBase < Base
      def initialize( name, url = 'http://localhost:8500')
        unless defined?(Diplomat)
          fail "Fetching data from consul requires the diplomat gem"
        end
        ::Diplomat.configure do |config|
          config.url = url
        end
      end


      def to_connect(value)
        if value.nil?
          nil
        else
          value = ::MethodHash[value.marshal_dump]
          value.extend(HashExtensions)
          value.stringify_keys
        end
      end
    end
  end
end
