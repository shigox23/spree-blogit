module Spree
  module Blogit
    module PostsHelper

      # Shows the blog title as a link on the index page and not on the post page
      def blog_title(post)
        if @post
          content_tag(:h1, class: "blogit_post__header") {post.title}
        else
          content_tag(:h2, class: "blogit_post__header") {link_to(post.title, blog_post_path(post.id), class: "blogit_post__header_link")}
        end
      end

      require "spree_blogit/archive"

      # Renders the comments for a {Post} based on the
      # {Blogit::Configuration::include_comments} configuration
      def comments_for_post(post)
        comment_type = SpreeBlogit.configuration.include_comments
        render(partial: "spree/blogit/comments/#{comment_type}_comments", locals: { post: post, comment: Spree::Blogit::Comment.new })
      end

      # Renders the comments for a JS share bar based on the
      # {Blogit::Configuration::include_share_bar} configuration
      def share_bar_for_post(post)
        return "" unless SpreeBlogit.configuration.include_share_bar
        render(partial: "spree/blogit/posts/share_bar", locals: { post: post})
      end

      # Returns the {Post Posts} that share one or more of the same tags for a given post
      #
      # post - A {Post} instance
      #
      # Returns a collection of {Post Posts}
      def related_posts_for_post(post)
        post.find_related_on_tags.active
      end

      # Creates a ul tag tree with posts by year and months. Include blogit/archive.js in
      # your js to enabled expand collapse.
      #
      # Examples
      #
      #   <%= archive_list_for_posts(@posts) %>
      #   # => <div class="blogit_archive">
      #          <ul class="blogit_archive__list blogit_archive__list--years">
      #            ...
      #          </ul>
      #        </div>
      #
      # Returns an HTML safe String
      def archive_list_for_posts(archive_posts)
        render SpreeBlogit::Archive::List.new(archive_posts)
      end

    end
  end
end
