class BeerController < ApplicationController

  def index
    @beerlist = []
    
    # TODO Fetch beer list here
    
    # FIXME Dummy Data
    @beerlist << {:upc => "123123", :name => "a bier", :qty => 5, :type => "IPA"}
    @beerlist << {:upc => "541354", :name => "another bier", :qty => 21, :type => "IPA"}
  end

  def edit
    if request.get?
        # TODO Fetch beer info

        # FIXME Dummy Data
        @beer = {:upc => "123123", :name => "a bier", :qty => 5, :type => "IPA"}
    elsif request.put?
    elsif request.delete?    
    end
  end

  def add
    if request.get?
    elsif request.post?
    end
  end
end
