class BeerController < ApplicationController

  def index
    @beerlist = []
    @beerlist << {:upc => "123123", :name => "a bier", :qty => 5, :type => "IPA"}
    @beerlist << {:upc => "541354", :name => "another bier", :qty => 21, :type => "IPA"}
  end
end
