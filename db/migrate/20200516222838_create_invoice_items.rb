class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.string :name
      t.string :description
      t.float :unit_price
      t.references :merchant, foreign_key: true

      t.timestamps
    end
  end
end
