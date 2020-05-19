class ItemSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :name,
             :description,
             :unit_price,
             :merchant_id,
             :updated_at,
             :created_at
end
