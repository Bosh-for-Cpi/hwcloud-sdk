module HwCloud
  class HwCloudSdk


      def describe_addresses(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "DescribeAddresses",
            :query    => options
        
        )
      end
    end
 end
