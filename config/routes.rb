Spree::Core::Engine.routes.draw do
  # Keep these above the posts resources block
  get 'blog/page/:page' => 'blogit/posts#index'
  get 'blog/tagged/:tag' => 'blogit/posts#tagged', as: :tagged_blog_posts

  namespace :blog, module: :blogit do
    resources :posts do
        resources :comments, only: [:create, :destroy]
    end
    get '/' => 'posts#index', as: :root
  end
end
