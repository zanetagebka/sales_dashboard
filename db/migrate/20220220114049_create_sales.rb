class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.date :date
      t.integer :quantity
      t.integer :revenue
    end
  end
end
