class StoreController < ApplicationController
	include CurrentCart
	before_action :set_cart
	
  def index
  	@count = increment_count 
  	@msg = "You've been here #{@count} times" if @count > 5
  	if params[:set_locale]
  		redirect_to store_url(locale: params[:set_locale])
  	else
  		@products = Product.order(:title)
  	end
  end

  def increment_count
	  session[:counter] ||= 0
	  session[:counter] += 1
	end
end
