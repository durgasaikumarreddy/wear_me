class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :brand
      t.string :name
      t.float :price
      t.string :size
      t.text :description

      t.timestamps
    end
  end
end
