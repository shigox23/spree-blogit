module SpreeBlogit
  class Engine < Rails::Engine

    require 'spree/core'
    require 'acts-as-taggable-on'

    isolate_namespace Spree

    engine_name 'spree_blogit'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end
    config.to_prepare &method(:activate).to_proc

    # require File.join(File.dirname(__FILE__), 'blogs.rb')

    initializer "spree_blogit.extend_active_record" do
      if defined?(::ActiveRecord::Base)
        ::ActiveRecord::Base.send(:include, SpreeBlogit::Blogs)
        ::ActiveRecord::Base.send(:include, Validators)
      end
    end
  end
end
