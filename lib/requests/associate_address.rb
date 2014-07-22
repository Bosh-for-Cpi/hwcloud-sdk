module HwCloud
  class HwCloudSdk


      def associate_address(options = {})

        request(
            :expects  => [200, 203],
            :method   => 'GET',
            :Action   => "AssociateAddress",
            :query    => options
        
        )
      end
    end
 end