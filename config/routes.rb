Rails.application.routes.draw do

resources :users

get "/" => "sessions#new"

get "/login" => "sessions#new"
post "/login" => "sessions#create"
get "/logout" => "sessions#destroy"
get "/signup" => "users#new"

get "/places" => "places#index"
post "/places" => "places#create"
get "/places/:winery_id" => "places#show"

post "/pets" => "pets#create"
get "/pets/new" => "pets#new"
get "/pets/:id/edit" => "pets#edit"
patch "/pets/:id" => "pets#update"
delete "/pets/:id" => "pets#destroy"

get "/users/:id" => "users#show"



# namespace :api do 
#   namespace :v1 do
#     get "/places" => "places#index"
#     get '/places:id' => 'places#show'
#   end
# end

#    Prefix Verb   URI Pattern               Controller#Action
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
#     login GET    /login(.:format)          sessions#new
#           POST   /login(.:format)          sessions#create
#    logout GET    /logout(.:format)         sessions#destroy
end
