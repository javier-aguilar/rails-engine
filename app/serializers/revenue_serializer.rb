class RevenueSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :revenue
end
