module HwCloud
  class HwCloudSdk


      def describe_volumes(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "DescribeVolumes",
            :query    => options

            #:path     => 'servers.json',

        )
      end
    end
 end
