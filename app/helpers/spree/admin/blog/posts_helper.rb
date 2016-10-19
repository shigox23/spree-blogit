module Spree
  module Admin
    module blog

      module PostsHelper
        def post_by_this_blogger?(post, blogger)
          post.blogger == blogger
        end

        # def id_from_param param
        #
        #   puts '&'*120
        #   puts param.to_s
        #   puts '&'*120
        #
        #   if number_or_nil param
        #     param
        #   end
        #
        #   /^(?<post_id>\d+)-.*$/ =~ param
        #
        #   puts '&'*120
        #
        #   post_id
        #
        #
        # end
        #
        # def number_or_nil(string)
        #   Integer(string || '')
        # rescue ArgumentError
        #   nil
        # end
      end

    end
  end
end
