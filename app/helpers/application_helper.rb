module ApplicationHelper
	def hidden_div_if(condition, attributes = {}, &block)
		
		if condition.nil? || condition.line_items.empty?
			attributes["style"] = "display: none"
		end
		content_tag("div", attributes, &block)
	end

	def average_rating (product_id)
	#byebug
    Rate.where("product_id="+product_id.to_s).average("rating").to_f
    
 
  end




 def child(product_id)
 	Rate.where("product_id="+product_id.to_s)
 end

 def temp(user_id)
 	User.where("user_id="+user_id.to_s).name
 end

end
