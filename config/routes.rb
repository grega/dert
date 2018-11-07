Rails.application.routes.draw do
	get 'verify', to: 'erasure_requests#verify', as: 'verify'

	resources :erasure_requests
end
