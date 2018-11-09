Rails.application.routes.draw do
  # This route is only for design purpose
  resources :design, only: [:show]

  devise_for :users, path: :auth
  devise_for :admin_users, ActiveAdmin::Devise.config

  namespace :api do
    resources :wizard_fields, only: [:index]
    resources :banks, only: [:index]
    resources :blog_posts, only: [:index]
  end

  # TODO: remove after migrate URL
  get '/santander', to: redirect('/bancos/santander')
  get '/sitemap', to: 'site#sitemap'

  root to: 'site#index'

  resources :users, only: [:create]


  resources :cards, path: 'cartoes-de-credito' do
    get :go_to_site, on: :member
    get '/filtro/(*path)', action: :index, on: :collection, as: :filter
  end

  resources :accounts, path: 'contas-corrente' do
    get :go_to_site, on: :member
    get '/filtro/(*path)', action: :index, on: :collection, as: :filter
  end

  resources :loans, path: 'emprestimos' do
    get :go_to_site, on: :member
    get '/filtro/(*path)', action: :index, on: :collection, as: :filter
  end

  resources :banks, path: 'bancos', only: [:show] do
    get '/filtro/(*path)', action: :show, on: :member, as: :filter
  end

  resources :cell_phone_plans, path: 'planos-celular' do
    get :go_to_site, on: :member
    get '/filtro/(*path)', action: :index, on: :collection, as: :filter
  end

  resources :insurances, path: 'seguros' do
    get :go_to_site, on: :member
    get '/filtro/(*path)', action: :index, on: :collection, as: :filter
  end

  resources :insurance_cars, path: 'seguro-auto' do
    get :go_to_site, on: :member
    get '/filtro/(*path)', action: :index, on: :collection, as: :filter
  end

  resources :insurance_travels, path: 'seguro-viagem' do
    get :go_to_site, on: :member
    get '/filtro/(*path)', action: :index, on: :collection, as: :filter
  end

  resources :investments, path: 'investimentos' do
    get :go_to_site, on: :member
    get '/filtro/(*path)', action: :index, on: :collection, as: :filter
  end

  resources :common_questions, path: 'perguntas-frequentes', only: [:index]

  resources :term_of_uses, path: 'termos-de-uso', only: [:index]

  resources :site, only: [:index] do
    get :sitemap, on: :collection
    get :legal, on: :collection
    get :perguntas_frequentes, on: :collection, path: :perguntas_frequentes
  end

  ActiveAdmin.routes(self)

  get '/:id', to: 'landing_pages#show', as: :landing
  get '/:id/go_to_site', to: 'landing_pages#go_to_site', as: :landing_go_to_site

  resources :wizards, only: [:show, :update] do
    get :result, on: :member
  end

end
