module HwCloud
  class HwCloudSdk
      def reboot_instances(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "RebootInstances",
            :query    => options
        )
      end
    end
 end
