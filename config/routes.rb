Rails.application.routes.draw do
  resources :user_followings
	resources :topics
	resources :answers
	resources :questions
	get '/follow_user' => 'questions#follow_user'
	get '/follow_topic' => 'questions#follow_topic'
	devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
	devise_scope :user do
		get "signup", to: "devise/registrations#new"
		get "login", to: "devise/sessions#new"
		get "logout", to: "devise/sessions#destroy"
	end
end
