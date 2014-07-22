module HwCloud
  class HwCloudSdk


    def describe_key_pairs(options = {})

      request(
          :expects  => [200, 203],
          :method   => 'GET',
          :Action   => "DescribeKeyPairs",
          :query    => options

      )
    end
  end
end