module HwCloud
  class HwCloudSdk


      def describe_instances(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "DescribeInstances",
            :query    => options
        
            #:path     => 'servers.json',

        )
      end
    end
 end
