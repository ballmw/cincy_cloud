::Refinery::Application.routes.draw do
  resources :twitter_streams, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :twitter_streams, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
