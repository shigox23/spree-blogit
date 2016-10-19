module Spree
  module blog

    class ApplicationController < Spree::StoreController

      helper Spree::blog::ApplicationHelper
      helper Spree::blog::LayoutHelper
      helper Spree::blog::PostsHelper
      helper Spree::blog::CommentsHelper

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
