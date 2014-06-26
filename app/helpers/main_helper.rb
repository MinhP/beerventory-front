module MainHelper
    def get_beer_list
        uri = URI.parse(URI::escape(ENDPOINT))
        request = Net::HTTP::Get.new(uri.request_uri)
        request.body = entry
        Net::HTTP.new(uri.host,uri.port).start{|http| http.request(request)}  
    end

    def get_beer(id = nil)
        uri = URI.parse(URI::escape(ENDPOINT))
        request = Net::HTTP::Get.new(uri.request_uri, headers)
        request.body = entry
        Net::HTTP.new(uri.host,uri.port).start{|http| http.request(request)}  
    end

    def add_beer(beer = nil)
        uri = URI.parse(URI::escape(ENDPOINT))
        headers={'content-type'=>'applications/json'}
        request = Net::HTTP::Post.new(uri.request_uri, headers)
        request.body = entry
        Net::HTTP.new(uri.host,uri.port).start{|http| http.request(request)}  
    end    

    def update_beer(beer = nil)
        uri = URI.parse(URI::escape(ENDPOINT))
        headers={'content-type'=>'applications/json'}
        request = Net::HTTP::Put.new(uri.request_uri, headers)
        request.body = entry
        Net::HTTP.new(uri.host,uri.port).start{|http| http.request(request)}  
    end

    def delete_beer(id = nil)
        uri = URI.parse(URI::escape(ENDPOINT))
        headers={'content-type'=>'applications/json'}
        request = Net::HTTP::Delete.new(uri.request_uri, headers)
        request.body = entry
        Net::HTTP.new(uri.host,uri.port).start{|http| http.request(request)}          
    end
end
