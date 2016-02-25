Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      namespace :customers do
        get 'find',     to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random',   to: 'random#show'
      end

      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index], module: "customers"
        resources :transactions, only: [:index], module: 'customers'
      end

      namespace :merchants do
        get 'find',         to: 'find#show'
        get 'find_all',     to: 'find#index'
        get 'random',       to: 'random#show'
        get 'most_revenue', to: 'most_revenue#index'
        get 'most_items',   to: 'most_items#index'
        get 'revenue',      to: 'revenue#index'
      end

      resources :merchants, only: [:index, :show] do
        resources :invoices, only: [:index], module: "merchants"
        resources :items,    only: [:index], module: "merchants"
      end

      namespace :items do
        get 'find',         to: 'find#show'
        get 'find_all',     to: 'find#index'
        get 'random',       to: 'random#show'
        get 'most_revenue', to: 'most_revenue#index'
        get 'most_items',   to: 'most_items#index'
      end

      resources :items, only: [:index, :show] do
        resources :invoice_items, only: [:index], module: "items"
        resources :merchant,      only: [:index], module: "items"
      end

      namespace :invoices do
        get 'find',     to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random',   to: 'random#show'
      end

      resources :invoices, only: [:index, :show] do
        resources :transactions,  only: [:index], module: "invoices"
        resources :invoice_items, only: [:index], module: "invoices"
        resources :items,         only: [:index], module: "invoices"
        resources :customer,      only: [:index], module: "invoices"
        resources :merchant,      only: [:index], module: "invoices"
      end

      namespace :invoice_items do
        get 'find',     to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random',   to: 'random#show'
      end

      resources :invoice_items, only: [:index, :show] do
        resources :invoice, only: [:index], module: "invoice_items"
        resources :item,    only: [:index], module: "invoice_items"
      end

      namespace :transactions do
        get 'find',     to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random',   to: 'random#show'
      end

      resources :transactions, only: [:index, :show] do
        resources :invoice, only: [:index], module: "transactions"
      end

    end
  end
end
