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
    :InstanceId => 'i-3EC606F4',
    :ImageName => 'gc-test',
    :ImageDesc => 'test-create-image',
}
reponse=service.create_image(options)

puts "****************************test.rb reponse.body***************************************"
puts reponse.body