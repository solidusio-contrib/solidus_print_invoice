# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :orders do
      member do
        get :show
      end
    end
  end
end
