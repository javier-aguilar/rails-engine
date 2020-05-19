class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :name, :updated_at, :created_at
  attributes :id, if: proc { |_, params|
    params[:show_id] == true
  }
end
