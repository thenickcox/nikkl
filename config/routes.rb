Rails.application.routes.draw do
  root to: 'links#new'
  resources :links
  get '/:slug', to: 'links#redirect_slug'

end
