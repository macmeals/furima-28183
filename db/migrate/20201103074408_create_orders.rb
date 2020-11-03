class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :post_code , null: false
      t.integer :prefecture_id , null: false
      t.string :city , null: false
      t.string :house_address , null: false
      t.string :building 
      t.string :tell_number , null: false
      t.integer :sold_item_id , null: false , foreign_key: true
      t.timestamps
    end
  end
end
