Magnetism::Engine.routes.draw do
  # root to: 'blogs#index'

  resource :blog, path: 'admin/blog', path_names: { new: 'setup' }
  resources :posts, path: 'admin/blog/posts', except: [:index] do
    resources :comments
  end
  
  get 'blog' => 'posts#index'
  get 'admin/blog/posts' => 'posts#index'
end
