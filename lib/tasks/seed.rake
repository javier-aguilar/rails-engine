require 'csv'

desc "clear db and seed db"
task seed: :environment do
  Invoice.destroy_all
  Transaction.destroy_all
  Item.destroy_all
  Customer.destroy_all
  Merchant.destroy_all
  InvoiceItem.destroy_all

  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end

  csv_text = File.read(Rails.root.join('lib', 'seeds', 'customers.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1', header_converters: :symbol)
  csv.each do |row|
    Customer.create!(first_name: row[:first_name],
                     last_name: row[:last_name],
                     created_at: row[:created_at],
                     updated_at: row[:updated_at])
  end

  csv_text = File.read(Rails.root.join('lib', 'seeds', 'merchants.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1', header_converters: :symbol)
  csv.each do |row|
    Merchant.create!(name: row[:name],
                     created_at: row[:created_at],
                     updated_at: row[:updated_at])
  end

  csv_text = File.read(Rails.root.join('lib', 'seeds', 'invoice_items.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1', header_converters: :symbol)
  csv.each do |row|
    InvoiceItem.create!(name: row[:name],
                        description: row[:description],
                        unit_price: row[:unit_price].to_i / 100.0,
                        merchant_id: row[:merchant_id],
                        created_at: row[:created_at],
                        updated_at: row[:updated_at])
  end

  csv_text = File.read(Rails.root.join('lib', 'seeds', 'invoices.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1', header_converters: :symbol)
  csv.each do |row|
    Invoice.create!(customer_id: row[:customer_id],
                    merchant_id: row[:merchant_id],
                    status: row[:status],
                    created_at: row[:created_at],
                    updated_at: row[:updated_at])
  end
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'items.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1', header_converters: :symbol)
  csv.each do |row|
    Item.create!(name: row[:name],
                 description: row[:description],
                 unit_price: row[:unit_price].to_i / 100.0,
                 merchant_id: row[:merchant_id],
                 created_at: row[:created_at],
                 updated_at: row[:updated_at])
  end
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'transactions.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1', header_converters: :symbol)
  csv.each do |row|
    Transaction.create!(invoice_id: row[:invoice_id],
                 credit_card_number: row[:credit_card_number],
                 credit_card_expiration_date: row[:credit_card_expiration_date],
                 result: row[:result],
                 created_at: row[:created_at],
                 updated_at: row[:updated_at])
  end
end
