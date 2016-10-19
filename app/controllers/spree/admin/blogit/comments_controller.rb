module Spree
  module Admin
    module blog
      class CommentsController < Spree::Admin::blog::ApplicationController

        def index
          @comments = post.comments.order('created_at DESC')
        end

        def create
          @comment = post.comments.new(comment_params)

          respond_to do |format|
            format.js {
              # the rest is dealt with in the view
              @comment.save
            }

            format.html {
              if @comment.save
                redirect_to admin_blog_post_comments_url(post), notice: t(:successfully_added_comment, scope: 'blog.comments')
              else
                render 'spree/blog/admin/posts/show'
              end
            }

          end

        end

        def destroy
          @comment = post.comments.find(params[:id])
          @comment.destroy
          redirect_to admin_blog_post_comments_url(post), notice: t(:successfully_removed_comment, scope: 'blog.comments')
        end

        private

        def comment_params
          params.require(:comment).permit(:name, :nickname, :email, :body, :website)
        end

        def post
          @post ||= Spree::blog::Post.find(params[:post_id])
        end

      end
    end

  end
end
