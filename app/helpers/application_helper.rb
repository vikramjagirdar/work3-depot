module ApplicationHelper
	def hidden_div_if(condition, attributes = {}, &block)

		
		if condition
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
 	User.find(user_id).name
 end

end
