module HwCloud
  class HwCloudSdk


      def create_volume(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "CreateVolume",
            :query    => options
        
            #:path     => 'servers.json',

        )
      end
    end
 end
