Spree::Core::Engine.routes.draw do
  # Keep these above the posts resources block
  get 'blog/page/:page' => 'blogit/posts#index'
  get 'blog/tagged/:tag' => 'blogit/posts#tagged', as: :tagged_blog_posts

  patch	'/admin/blog/posts/:id/edit' => 'admin/blogit/posts#edit' 

  namespace :blog, module: :blogit do
    resources :posts, param: :slug do
        resources :comments, only: [:create, :destroy]
    end
    get '/' => 'posts#index', as: :root
  end

  namespace :admin do
    namespace :blog, module: :blogit do
      resources :posts do
        resources :comments
      end
      get '/' => 'posts#index', as: :root
    end
  end

end
