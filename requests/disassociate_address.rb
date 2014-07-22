module HwCloud
  class HwCloudSdk


    def disassociate_address(options = {})

      request(
          :expects  => [200, 203],
          :method   => 'GET',
          :Action   => "DisassociateAddress",
          :query    => options



      )
    end
  end
end