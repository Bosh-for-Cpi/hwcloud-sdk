__LIB_DIR__ = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift __LIB_DIR__ unless $LOAD_PATH.include?(__LIB_DIR__)

require 'multi_json'
require "connection"
require 'requests/describe_instances'
require 'requests/describe_security_groups'
require 'requests/describe_key_pairs'
require 'requests/describe_volumes'
require 'requests/create_volume'
require 'requests/delete_volume'
require 'requests/attach_volume'
require 'requests/detach_volume'
require 'requests/reboot_instances'
require 'requests/terminate_instances'
require 'requests/run_instances'
require 'requests/stop_instances'
require 'requests/describe_addresses'
require 'requests/associate_address'
require 'requests/disassociate_address'
require 'requests/describe_images'
require 'requests/describe_images_by_name'
require 'requests/create_image'
require 'requests/delete_images'

module  HwCloud

    class HwCloudSdk

      #sort param key=value&key=value
      def Getparamtostring(signParameter)
        # signParameter.values.each do |k| k=URI.encode_www_form_component(k).gsub("+", "%20") end
        puts "****************************Getparamtostring.input.signParameter***************************************"
        puts signParameter
        puts "******************************************************************\n\n"
        signParametersort = signParameter.sort{|a,b| a <=> b }  ;
        parameterstrins="GET\n"
        signParametersort.each do |k,v|
          if k=="url" || k=="Key"
            next
          end
        parameterstrins += "#{k}" + "=" + "#{URI.encode_www_form_component(v).gsub("+", "%20")}" + "&" end
        return parameterstrins = (parameterstrins.chop).to_s
      end


      def initialize(options={})
        @signParameter=options
        @url= options[:url]
        uri =URI.parse(@url)
        @host=uri.host
        @port=uri.port
        @scheme=uri.scheme
        @path = uri.path

        @hwsaccesskeyid=options[:HWSAccessKeyId]
        @signaturemethod=options[:SignatureMethod]
        #@signaturenonce=options[:SignatureNonce]
        @signatureversion=options[:SignatureVersion]
        @version=options[:version]
        @regionname=options[:RegionName]

        @key=options[:Key]

        @persistent =  false
        @connection = HwCloud::Connection.new("#{@scheme}://#{@host}:#{@port}", @persistent, :persistent => false)

      end


      def reload
        @connection.reset
      end


      def request(params)
        puts "----------------------------------huaweicloud.rb---------request.input.params---------------------------------"
        puts params
        puts "******************************************************************\n\n"

        @signParameter[:Timestamp]=(Time.now.to_f*1000).to_i 
        @signParameter[:Action] =params[:Action]
        sumpara=@signParameter.merge params[:query]


        sinaturenonce = rand(100000)
        sumpara[:SignatureNonce] = signaturenonce
        puts "----------------------------------huaweicloud.rb---------request.sumpara---------------------------------"
        puts sumpara
        puts "******************************************************************\n\n"

        inputparam= Getparamtostring  sumpara
        digest = OpenSSL::Digest.new("sha256")

        puts("inputparam           : " + inputparam)
        puts "******************************************************************\n\n"

        hmac = OpenSSL::HMAC.digest(digest, @key, inputparam)
        signature = Base64.encode64(hmac)

        puts("Signature           : " + signature)
        puts "******************************************************************\n\n"

        sumpara[:Signature]=signature.chop;
        puts "----------------------------------huaweicloud.rb---------@query=sumparar---------------------------------"
        puts sumpara
        puts "******************************************************************\n\n"
        @query=sumpara


        response = @connection.request(params.merge({
                    :headers  => {
                        'Accept' => 'application/json',
                        'Host'=> "#{@host}:#{@port}",
                        'Proxy-Connection'=> 'keep-alive',
                        'Referer'=>"#{@scheme}://#{@host}:#{@port}/openapi/showcase/index.html",
                    }.merge!(params[:headers] || {}),
                    :path     => @path,
                    :query    => @query
                                                    }))
		return MultiJson.load(response.body)

      end
    end
end
