module HwCloud
  class HwCloudSdk


    def describe_security_groups(options = {})

      request(
          :expects  => [200, 203],
          :method   => 'GET',
          :Action   => "DescribeSecurityGroups",
          :query    => options



      )
    end
  end
end