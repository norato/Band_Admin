BandAdmin::Application.routes.draw do
  resources :proprietarios
  resources :locais
  resources :eventos
  resources :organizadors
  resources :repertorios
  resources :musicas
  resources :ordemmusicas

  get "pages/inicio"
  root :to => 'pages#inicio'
  mount Dinde::Engine => "/dinde"
end
