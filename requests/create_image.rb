module HwCloud
  class HwCloudSdk


      def create_image(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "CreateImage",
            :query    => options
        
            #:path     => 'servers.json',

        )
      end
    end
 end
