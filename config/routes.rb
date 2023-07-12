Rails.application.routes.draw do
  root to: 'static_pages#top'
  get '/auth/:provider/callback', to: 'oauths#callback', as: :oauth_callback
  post '/auth/:provider/callback', to: 'oauths#callback'
  get '/auth/:provider', to: 'oauths#oauth', as: :auth_at_provider
  get 'oauths/secret_word', to: 'oauths#secret_word'
  post 'oauths/secret_word', to: 'oauths#secret_word'
  get 'login', to: 'oauths#login', as: :login
  delete 'logout', to: 'oauths#destroy', as: :logout
end
