module HwCloud
  class HwCloudSdk


      def describe_images_by_name(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "DescribeImages",
            :query    => options
        
            #:path     => 'servers.json',

        )
      end
    end
 end
