module Spree
  module Admin
    module Blogit


      # Inherits from the application's controller instead of ActionController::Base
      class ApplicationController < ResourceController #SpreeBlogit.configuration.admin_application_controller_base_class.constantize

        def self.blogit_conf
          SpreeBlogit.configuration
        end

        def blogit_conf
          self.class.blogit_conf
        end

        #layout blogit_conf.admin_layout
        helper Spree::Blogit::ApplicationHelper, Spree::Admin::Blogit::CommentsHelper,
          Spree::Admin::Blogit::PostsHelper, Spree::Admin::Blogit::LayoutHelper


        helper_method :blogit_conf, :current_blogger


        private


        def authenticate_blogger
          if defined?(super)
            super
          else
            raise NotImplementedError,
              "Please define :authenticate_blogger in your ApplicationController.\
                Spree::Admin::Blogit needs this to determine who's signed in."
          end
        end

        def blogit_admin_sign_in_url
          new_session_url
        end

        def current_blogger

          spree_current_user

          # if defined?(super)
          #   super
          # else
          #   raise NotImplementedError,
          #     "Please define :current_blogger in your ApplicationController.\
          #       Spree::Admin::Blogit needs this to determine who's signed in."
          # end
        end
      end

    end
  end
end
