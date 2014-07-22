module HwCloud
  class HwCloudSdk

      def run_instances(options = {})
        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "RunInstances",
            :query    => options
        )
      end
    end
 end
