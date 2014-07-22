module HwCloud
  class HwCloudSdk


      def detach_volume(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "DetachVolume",
            :query    => options
        
            #:path     => 'servers.json',

        )
      end
    end
 end
