require 'connect/datasources/consul_base'

module Connect
  module Datasources
    ##
    #
    # The Datasource that allows you t get data from the Consul Service Store
    #
    #
    class ConsulServiceStore < ConsulBase

      def lookup(service)
        value = ::Diplomat::Service.get(service)
        value = value.is_a?(Array) ? value.collect{|v| to_connect(v)} : to_connect(value)
        value
      end
    end
  end
end
