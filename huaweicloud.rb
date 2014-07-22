require "../connection"
require 'describe_instances'
require 'describe_security_groups'
require 'describe_key_pairs'
require 'describe_volumes'
require 'create_volume'
require 'delete_volume'
require 'attach_volume'
require 'detach_volume'
require 'reboot_instances'
require 'terminate_instances'
require 'run_instances'
require 'stop_instances'
require 'associate_address'
require 'disassociate_address'
require 'describe_images'
require 'describe_images_by_name'
require 'create_image'
require 'delete_images'

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
        @signaturenonce=options[:SignatureNonce]
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


      end
    end
end
