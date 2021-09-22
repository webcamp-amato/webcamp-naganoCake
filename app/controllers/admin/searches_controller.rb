class Admin::SearchesController < ApplicationController
    def search
      @value = params["value"]
      @category = params["category"]
      if @category == "Customer"
        @customers = Customer.search_for(@value).page(params[:id]).per(10)
      else
        @items = Item.search_for(@value).page(params[:id]).per(10)
      end
    end
    
    
end
