Rails.application.routes.draw do
  root 'users#welcome'
  get 'questions/add_option'
  get 'papers/add_option'
  get 'users/add_paper/:id' => 'users#add_paper'
  post 'users/update_roles/:id' => 'users#update_roles'
  patch 'users/update_roles/:id' => 'users#update_roles'
  post 'users/update_papers/:id' => 'users#update_papers'
  get 'users/welcome'
  get 'tests/thanks'
  devise_for :users, :controllers =>{registrations: 'registrations'}

  get 'users/manage_roles'
  get 'tests/start_test'
  get 'tests/welcome'
  post 'tests/process_welcome' => 'tests#process_welcome'

  #match  'papers/:paper_id/tests/start_test' ,to: 'tests/start_test', via: [:get]
  resources 'papers'   do
    resources 'tests', except: [:edit, :update, :destroy]
    #get 'new_paper_test_path'
  end
  get 'papers/index'
  get 'papers/new'

  resources 'tests'
  get 'tests/new'
  get 'tests/index'

  resources 'responses', only: [:index]
  get 'responses/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources 'roles'
  get 'roles/index'

  resources 'users' do
    get '/tests/:id/result', to: 'tests#result'
  end
  get 'users/index'
  get 'users/new'


  resources 'questions' do
    resources 'options'
    get 'options/new'
  end

  get 'questions/new'
  get 'options/new'
end
