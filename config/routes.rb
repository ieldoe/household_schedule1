Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    # ↓ローカルに追加されたコントローラーを参照する(コントローラー名: "コントローラーの参照先")
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :days do
    collection do
      get :search
      get :graph
    end
  end
  resources :tags, only: %i[update edit destroy index create new]
end
