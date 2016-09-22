module Spree
  module Admin
    module Blogit

      class PostsController < Spree::Admin::Blogit::ApplicationController

        include Spree::Admin::Blogit::PostsHelper

        attr_accessor :post

        def index
          set_posts
          set_latest_comments
        end

        def show
          Blogit::configuration.include_comments = :disqus
          set_post_from_id(false)
          set_latest_comments
        end

        def new
          set_new_blogger_post_from_params
        end

        def create
          set_new_blogger_post_from_params
          if post.save
            redirect_to edit_admin_blog_post_url(post), notice: t(:blog_post_was_successfully_created, scope: 'blogit.admin.posts')
          else
            render action: 'new'
          end
        end

        def edit
          set_post_from_id(false)
        end

        def update
          set_post_from_id(false)

          if post.update_attributes(post_params)
            redirect_to edit_admin_blog_post_url(post), notice: t(:blog_post_was_successfully_updated, scope: 'blogit.admin.posts')
          else
            render action: 'edit'
          end
        end

        def destroy
          set_post_from_id(false)
          post.destroy
          redirect_to admin_blog_posts_url, notice: t(:blog_post_was_successfully_destroyed, scope: 'blogit.admin.posts')
        end

        def post_params
          if params[:blogit_post]
            params.require(:blogit_post).permit(:title, :slug, :body, :tag_list, :state, :description)
          else
            {}
          end
        end

        private

        def set_post_from_id(must_be_own_post)
          if must_be_own_post
            @post = current_blogger.blog_posts.find(params[:id])
          else
            @post = Spree::Blogit::Post.find(params[:id])
          end
        end

        def set_posts
          @posts = Spree::Blogit::Post.for_admin_index(params[Kaminari.config.param_name])
        end

        def set_latest_comments
          @latest_comments = Spree::Blogit::Comment.latest
        end

        def set_new_blogger_post_from_params
          @post = current_blogger.blog_posts.new(post_params)
        end

      end

    end
  end
end
