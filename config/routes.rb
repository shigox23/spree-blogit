# SpreeBlogit::Engine.routes.draw do
Spree::Core::Engine.routes.draw do

  # blog = Spree::Blogit
  namespace :blog, module: :blogit do
  # # Keep these above the posts resources block
    # get "page/:page" => "spree/blogit/posts#index"
    # get "tagged/:tag" => 'posts#tagged', as: :tagged_blog_posts
    #

    resources :posts do
        resources :comments, only: [:create, :destroy]
    end

    get '/' => 'blogit/posts#index', as: :blog_root
  end

end
