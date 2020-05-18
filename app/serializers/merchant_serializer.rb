class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :name
  attributes :id, if: proc { |_, params|
    params[:show_id] == true
  }
end
