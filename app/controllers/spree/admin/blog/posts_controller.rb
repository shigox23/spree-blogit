module Spree
  module Admin
    module blog

      class PostsController < Spree::Admin::blog::ApplicationController

        include Spree::Admin::blog::PostsHelper

        attr_accessor :post

        def index
          set_posts
          set_latest_comments
        end

        def show
          blog::configuration.include_comments = :disqus
          set_post_from_id(false)
          set_latest_comments
        end

        def new
          set_new_blogger_post_from_params
        end

        def create
          set_new_blogger_post_from_params
          if post.save
            redirect_to edit_admin_blog_post_url(post), notice: t(:blog_post_was_successfully_created, scope: 'blog.admin.posts')
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
            redirect_to edit_admin_blog_post_url(post), notice: t(:blog_post_was_successfully_updated, scope: 'blog.admin.posts')
          else
            render action: 'edit'
          end
        end

        def destroy
          set_post_from_id(false)
          post.destroy
          redirect_to admin_blog_posts_url, notice: t(:blog_post_was_successfully_destroyed, scope: 'blog.admin.posts')
        end

        def post_params
          if params[:blog_post]
            params.require(:blog_post).permit(:title, :slug, :body, :tag_list, :state, :description)
          else
            {}
          end
        end

        private

        def set_post_from_id(must_be_own_post)
          if must_be_own_post
            @post = current_blogger.blog_posts.find(params[:id])
          else
            @post = Spree::blog::Post.find(params[:id])
          end
        end

        def set_posts
          @posts = Spree::blog::Post.for_admin_index(params[Kaminari.config.param_name])
        end

        def set_latest_comments
          @latest_comments = Spree::blog::Comment.latest
        end

        def set_new_blogger_post_from_params
          @post = current_blogger.blog_posts.new(post_params)
        end

      end

    end
  end
end
