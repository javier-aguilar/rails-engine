class ItemSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :name, :description, :unit_price, :merchant_id
end
