Rails.application.routes.draw do
  devise_for :users

  get '/404', :to => "errors#not_found"
  get '/422', :to => "errors#unacceptable"
  get '/500', :to => "errors#server_error"

  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
