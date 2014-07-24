#encoding=utf-8
$LOAD_PATH << File.dirname(__FILE__)
require 'uri'
require 'excon'
require "openssl"
require "base64"
require 'uri'

require '../connection'
require '../hwcloud-sdk'



service = HwCloud::HwCloudSdk.new({
                                      :url  => 'http://124.238.239.18:8080/openapi/ec2/',
                                      :HWSAccessKeyId    => '6D9EA5E06E03E40C79FCCD501F3A9D7B',
                                      :Key   => "FE2020A89E598B4EE2D82DA4985D1C0E",
                                      :SignatureMethod  => 'HmacSHA256',
                                      :SignatureNonce => 1000,
                                      :SignatureVersion => 1,
                                      :version => 1,
                                      :RegionName=> "中国华北",
                                  })

options={
    :Size              =>  20,
    :InstanceId        =>  'i-4BF5091C',
    :AvailabilityZone  =>  'b451c1ea3c8d4af89d03e5cacf1e4276'
}
reponse=service.create_volume(options)

puts "****************************test.rb reponse.body***************************************"
puts reponse.body
