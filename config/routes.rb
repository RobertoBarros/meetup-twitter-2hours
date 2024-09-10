Rails.application.routes.draw do
  devise_for :users

  resources :twitts, only: [:create] do
    post "like", to: "twitts#like", on: :member
  end

  root "twitts#index"
end
