Rails.application.routes.draw do
	get 'verify_erasure_request', to: 'verify#erasure_request', as: 'verify_erasure_request'

	resources :erasure_requests
	resources :properties
end
