module Spree
  module Admin
    module Blog


      # Inherits from the application's controller instead of ActionController::Base
      class ApplicationController < ResourceController #SpreeBlog.configuration.admin_application_controller_base_class.constantize

        def self.blog_conf
          SpreeBlog.configuration
        end

        def blog_conf
          self.class.blog_conf
        end

        #layout blog_conf.admin_layout
        helper Spree::Blog::ApplicationHelper, Spree::Admin::Blog::CommentsHelper,
          Spree::Admin::Blog::PostsHelper, Spree::Admin::Blog::LayoutHelper


        helper_method :blog_conf, :current_blogger


        private


        def authenticate_blogger
          if defined?(super)
            super
          else
            raise NotImplementedError,
              "Please define :authenticate_blogger in your ApplicationController.\
                Spree::Admin::Blog needs this to determine who's signed in."
          end
        end

        def blog_admin_sign_in_url
          new_session_url
        end

        def current_blogger

          spree_current_user

          # if defined?(super)
          #   super
          # else
          #   raise NotImplementedError,
          #     "Please define :current_blogger in your ApplicationController.\
          #       Spree::Admin::Blog needs this to determine who's signed in."
          # end
        end
      end

    end
  end
  helper Bootsy::Engine.helpers
end
