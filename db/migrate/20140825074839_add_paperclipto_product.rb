class AddPapercliptoProduct < ActiveRecord::Migration
add_attachment :products, :image  
  def up
  end

  def down
  end
end
