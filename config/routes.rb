Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope module: "merchants" do
        get 'merchants/find_all', to: 'search#index'
        get 'merchants/find', to: 'search#show'
        get 'merchants/most_revenue', to: 'revenue#index'
        get 'merchants/most_items', to: 'most_items#index'
      end

      scope module: "items" do
        get 'items/find_all', to: 'search#index'
        get 'items/find', to: 'search#show'
      end

      resources :merchants do
        scope module: "merchants" do
          resources :items
        end
      end

      resources :items do
        scope module: "items" do
          resources :merchant, only: [:index]
        end
      end
    end
  end
end
