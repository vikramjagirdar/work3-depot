module ApplicationHelper
	def hidden_div_if(condition, attributes = {}, &block)
		
		if condition.nil? || condition.line_items.empty?
			attributes["style"] = "display: none"
		end
		content_tag("div", attributes, &block)
	end
end
