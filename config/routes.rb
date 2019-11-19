Rails.application.routes.draw do
  resources :played_songs
  root :to => "played_songs#index"
end
