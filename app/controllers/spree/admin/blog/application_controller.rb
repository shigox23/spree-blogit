module Spree
  module Admin
    module blog


      # Inherits from the application's controller instead of ActionController::Base
      class ApplicationController < ResourceController #Spreeblog.configuration.admin_application_controller_base_class.constantize

        def self.blog_conf
          Spreeblog.configuration
        end

        def blog_conf
          self.class.blog_conf
        end

        #layout blog_conf.admin_layout
        helper Spree::blog::ApplicationHelper, Spree::Admin::blog::CommentsHelper,
          Spree::Admin::blog::PostsHelper, Spree::Admin::blog::LayoutHelper


        helper_method :blog_conf, :current_blogger


        private


        def authenticate_blogger
          if defined?(super)
            super
          else
            raise NotImplementedError,
              "Please define :authenticate_blogger in your ApplicationController.\
                Spree::Admin::blog needs this to determine who's signed in."
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
          #       Spree::Admin::blog needs this to determine who's signed in."
          # end
        end
      end

    end
  end
end
