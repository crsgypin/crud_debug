class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.integer :user_id, :index=>true
      t.integer :price
      t.integer :category_id, :index=>true

      t.timestamps null: false
    end
  end
end
