module HwCloud
    class Connection

      def initialize(url, persistent=false, params={})
        unless params.has_key?(:debug_response)
          params[:debug_response] = true
        end
        params[:headers] ||= {}
        params[:headers]['User-Agent'] ||= "fog/1.0"
        puts "----------------------------------connection.rb---------initialize----------------------------"

        @excon = Excon.new(url,{} )
        @persistent = persistent
      end

      def request(params, &block)
        reset unless @persistent

        puts "----------------------------------connection.rb---------request.input.params---------------------------------"
        puts params
        puts "******************************************************************\n\n"

        params.delete(:Action)
        @excon.request(params, &block)
      end

      alias_method :original_request, :request
      protected :original_request

      def reset
        @excon.reset
      end
    end

end
