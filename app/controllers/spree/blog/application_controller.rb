module Spree
  module Blog

    class ApplicationController < Spree::StoreController

      helper Spree::Blog::ApplicationHelper
      helper Spree::Blog::LayoutHelper
      helper Spree::Blog::PostsHelper
      helper Spree::Blog::CommentsHelper

      helper_method :blog_conf

      # A helper method to access the {Blog::configuration} at the class level.
      #
      # Returns a Blog::Configuration
      def self.blog_conf
        SpreeBlog::configuration
      end

      # A helper method to access the {Blog::configuration} at the controller instance
      #   level.
      #
      # Returns a Blog::Configuration
      def blog_conf
        self.class.blog_conf
      end

    end

  end
end
