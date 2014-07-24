class Rate < ActiveRecord::Base
  attr_accessible :product_id, :rating, :review, :user_id
  belongs_to :user
  belongs_to :product
  validates :rating, presence: true
  validates_uniqueness_of :product_id, :scope => [:user_id]
  # add_index :rates, [:product_id, :user_id], :unique => true
  

end
