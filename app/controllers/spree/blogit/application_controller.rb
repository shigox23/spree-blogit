module Spree
  module Blogit

    class ApplicationController < Spree::StoreController

      helper Spree::Blogit::ApplicationHelper
      helper Spree::Blogit::LayoutHelper
      helper Spree::Blogit::PostsHelper
      helper Spree::Blogit::CommentsHelper

      helper_method :blogit_conf

      # A helper method to access the {Blogit::configuration} at the class level.
      #
      # Returns a Blogit::Configuration
      def self.blogit_conf
        Blogit::configuration
      end

      # A helper method to access the {Blogit::configuration} at the controller instance
      #   level.
      #
      # Returns a Blogit::Configuration
      def blogit_conf
        self.class.blogit_conf
      end

    end

  end
end
