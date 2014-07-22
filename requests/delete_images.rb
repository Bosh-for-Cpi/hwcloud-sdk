module HwCloud
  class HwCloudSdk


      def delete_images(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "DeleteImages",
            :query    => options
        
            #:path     => 'servers.json',

        )
      end
    end
 end
