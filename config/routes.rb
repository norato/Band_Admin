BandAdmin::Application.routes.draw do
  resources :proprietarios
  resources :locais
  resources :eventos
  resources :organizadors
  resources :repertorios
  resources :musicas
  resources :ordemmusicas
end
