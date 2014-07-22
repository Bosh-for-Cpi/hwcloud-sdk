module HwCloud
  class HwCloudSdk


      def delete_volume(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "DeleteVolume",
            :query    => options

            #:path     => 'servers.json',

        )
      end
    end
 end
