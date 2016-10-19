module Spree
  module Blog

    class ApplicationController < Spree::StoreController

      helper Spree::Blog::ApplicationHelper
      helper Spree::Blog::LayoutHelper
      helper Spree::Blog::PostsHelper
      helper Spree::Blog::CommentsHelper

      helper_method :blog_conf

      # A helper method to access the {blog::configuration} at the class level.
      #
      # Returns a blog::Configuration
      def self.blog_conf
        Spreeblog::configuration
      end

      # A helper method to access the {blog::configuration} at the controller instance
      #   level.
      #
      # Returns a blog::Configuration
      def blog_conf
        self.class.blog_conf
      end

    end

  end
end
