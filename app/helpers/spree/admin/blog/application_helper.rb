module Spree
  module Admin
    module Blog

      module ApplicationHelper

        def actions(options = {}, &block)
          yield
        end

        def muted_text(text_or_options = {}, options ={}, &block)
          if block_given?
            content = capture(&block)
            options = text_or_options
          else
            content = text_or_options
          end
          options[:class] = Array(options[:class]) + [ "muted_text" ]
          content_tag(:div, content, options)
        end

      end

    end
  end
end
