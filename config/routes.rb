Rails.application.routes.draw do
  get 'home/index'

  delete "logout" => "sessions#logout"

  get 'sessions/new'

  post 'sessions/create'

  get 'applicants/new'

  post 'applicants/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
