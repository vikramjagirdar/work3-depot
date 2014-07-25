class StoreController < ApplicationController
	skip_before_filter :authorize
  def index
  @products = Product.order(:title)
  @cart=current_cart
  end

  def sort_product
   a={}
  @product=Product.all
  @product.each do |product|
   temp= product.id
  a.merge!("#{temp}" => average_rating(product.id))
  
 end
 
 
 # iter = a.sort_by {|_key, value| value}.reverse.count.to_i

  
 #var= Product.find_by_id(a.sort_by {|_key, value| value}.reverse[iter][0].to_i).title
 @product_obj = []
 var = a.sort_by {|_key, value| value}.reverse
 var.each do |val|
 	@product_obj << Product.find_by_id(val[0].to_i)
 end
 
 

  
  
render 'index1'
 
end
end
