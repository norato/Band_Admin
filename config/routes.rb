BandAdmin::Application.routes.draw do
  resources :proprietarios
  resources :locais
  resources :eventos
  resources :organizadors
end
