::Refinery::Application.routes.draw do
  resources :related_links, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :related_links, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
