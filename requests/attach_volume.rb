module HwCloud
  class HwCloudSdk


      def attach_volume(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "AttachVolume",
            :query    => options
        
            #:path     => 'servers.json',

        )
      end
    end
 end
