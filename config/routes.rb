Spree::Core::Engine.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  # Keep these above the posts resources block
  get 'blog/page/:page' => 'blog/posts#index'
  get 'blog/category/:tag' => 'blog/posts#tagged', as: :tagged_blog_posts

  patch	'/admin/blog/posts/:id/edit' => 'admin/blog/posts#edit'

  namespace :blog, module: :blog do
    resources :posts, param: :slug, only: :index do
        resources :comments, only: [:create, :destroy]
    end
    get '/' => 'posts#index', as: :root
    get '/:slug' => 'posts#show', as: :post
  end

  namespace :admin do
    namespace :blog, module: :blog do
      resources :posts do
        resources :comments
      end
      get '/' => 'posts#index', as: :root
    end
  end
end
