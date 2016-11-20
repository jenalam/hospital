Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  #set the index page / root url
  root 'pages#login'


  get 'hospitalsim' => 'pages#login'
  post 'hospitalsim' => 'pages#login'

  get 'makequery' => 'makequery#querysend'
  post 'addvalue' => 'addvalue#insert'

  get 'doctor' => 'pages#doctor'
  get 'nurse' => 'pages#nurse'
  get 'admin' => 'pages#admin'
  get 'findPatient' => 'pages#find_patient'
  get 'managePrescription' => 'pages#manage_prescriptions'
  get 'usualPrescription' => 'pages#usual_treatments'
  get 'addPrescription' => 'pages#add_prescription'
  get 'removePrescription' => 'pages#remove_prescription'
  get 'managePatient' => 'pages#manage_patient'
  get 'doctorsPrescription' => 'pages#doctors_prescription'
  get 'issueMedication' => 'pages#issue_medication'
  post 'issueMedication' => 'pages#issue_medication_post'
  get 'patientProfile' => 'pages#patient_profile'
  get 'removeRoom' => 'pages#remove_room'



  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
