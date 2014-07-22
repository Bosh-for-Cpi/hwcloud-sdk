module HwCloud
  class HwCloudSdk


      def stop_instances(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "StopInstances",
            :query    => options
        
            #:path     => 'servers.json',

        )
      end
    end
 end
