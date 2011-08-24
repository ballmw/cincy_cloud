::Refinery::Application.routes.draw do
  resources :buzzs, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :buzzs, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
