require 'connect/datasources/consul_base'

module Connect
  module Datasources
    ##
    #
    # The data source that reads data from the Consul value store
    #
    #
    class ConsulValueStore < ConsulBase

      def lookup(key)
        ::Diplomat::Kv.get(key)
      end
    end
  end
end
