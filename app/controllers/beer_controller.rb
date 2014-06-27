class BeerController < ApplicationController

  def show
    @beerlist = JSON.parse(get_beer_list.downcase)
  end

  def edit
    if params[:id] == "1"
        @beer = {'upc' => "123123", 'name' => "not a bier", 'qty' => 5, 'type' => "Cider"}
    else
        @beer = {'upc' => "123123", 'name' => "a bier", 'qty' => 5, 'type' => "IPA"}
    end
  end

  def update
    @beer = {}
    @beer['name'] = params['name']
    @beer['type'] = params['type']
    @beer['qty'] = params['qty']
    @beer['upc'] = params['upc']

    update_beer @beer
    redirect_to "/"
  end

  def new
  end

  def create
    logger.debug "Adding new Beer..."
    @beer = {}
    @beer['name'] = params['name']
    @beer['type'] = params['type']
    @beer['qty'] = params['qty']
    @beer['upc'] = params['upc']

    add_beer @beer
    redirect_to "/"
  end

  def destroy
    delete_beer params[:id]
    redirect_to "/"
  end

  #Helpers
    def get_beer_list
        begin
            uri = URI.parse(URI::escape("#{Rails.configuration.beer.endpoint}/beer"))
            request = Net::HTTP::Get.new(uri.request_uri)
            request.body = nil
            response = Net::HTTP.new(uri.host,uri.port).start{|http| http.request(request)}
            response.body
        rescue Exception => e
            puts e
        end
    end

    def get_beer(id = nil)
        begin
            uri = URI.parse(URI::escape("#{Rails.configuration.beer.endpoint}/beer/#{id}"))
            request = Net::HTTP::Get.new(uri.request_uri, headers)
            request.body = entry
            Net::HTTP.new(uri.host,uri.port).start{|http| http.request(request)}
        rescue Exception => e
            puts e
        end
    end

    def add_beer(beer = nil)
        puts "add beer"
        entry = beer.to_json

        begin
            uri = URI.parse(URI::escape("#{Rails.configuration.beer.endpoint}/beer"))
            headers={'content-type'=>'applications/json'}
            request = Net::HTTP::Post.new(uri.request_uri, headers)
            request.body = entry
            Net::HTTP.new(uri.host,uri.port).start{|http| http.request(request)}
        rescue Exception => e
            puts e
        end
    end    

    def update_beer(beer = nil)
        puts "update beer"
        entry = beer.to_json

        begin
            uri = URI.parse(URI::escape("#{Rails.configuration.beer.endpoint}/beer/#{beer['upc']}"))
            headers={'content-type'=>'applications/json'}
            request = Net::HTTP::Put.new(uri.request_uri, headers)
            request.body = beer
            Net::HTTP.new(uri.host,uri.port).start{|http| http.request(request)}
        rescue Exception => e
            puts e
        end
    end

    def delete_beer(id = nil)
        begin
            uri = URI.parse(URI::escape("#{Rails.configuration.beer.endpoint}/beer/id"))
            headers={'content-type'=>'applications/json'}
            request = Net::HTTP::Delete.new(uri.request_uri, headers)
            request.body = nil
            Net::HTTP.new(uri.host,uri.port).start{|http| http.request(request)}
        rescue Exception => e
            puts e
        end
    end
end
