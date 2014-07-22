module HwCloud
  class HwCloudSdk
      def terminate_instances(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "TerminateInstances",
            :query    => options
        )
      end
    end
 end
