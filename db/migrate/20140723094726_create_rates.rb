class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
