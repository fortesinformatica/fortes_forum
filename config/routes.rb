Rails.application.routes.draw do
  namespace :fortes_forum do
    resources :foruns
    resources :posts
  end
end
