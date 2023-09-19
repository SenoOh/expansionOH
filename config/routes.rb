Rails.application.routes.draw do
  resources :peopleitems do
    collection do
      get 'people_generate' # GET /peopleitems/people_generate
      get 'people_delete'
      # get 'open'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  # root 'articles#index' 
  # post 'generate_templates', to: 'articles#generate_templates'
  # post 'convert', to: 'articles#convert'

  # get "/articles", to: "articles#index"
  # get 'excel_to_json/convert', to: 'excel_to_json#convert'
  # root "welcom#index"
end
