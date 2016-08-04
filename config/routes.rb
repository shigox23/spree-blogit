# Spree::Core::Engine.routes.draw do
#   # Add your extension routes here
# end

# SpreeBlogit::Engine.routes.draw do
Spree::Core::Engine.routes.draw do

  # Keep these above the posts resources block
  get "blog/page/:page" => "posts#index"
  get "blog/tagged/:tag" => 'posts#tagged', as: :tagged_blog_posts

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  get "/blog/" => "posts#index", as: :blog_root

end
