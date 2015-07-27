class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :user_id, :index=>:true
    	t.integer :product_id, :index=>:true
    	t.string :content

      t.timestamps null: false
    end
  end
end
