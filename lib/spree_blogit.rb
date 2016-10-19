require 'spree_core'

# Third-party requirements
require "kaminari"
require "redcarpet"

require "spree_blog/configuration"
require "spree_blog/blogs"
require "spree_blog/engine"
require "spree_blog/parsers"

require "validators"

module Spreeblog

  autoload :Kaminari, "kaminari"

  # Exception raised when gem may not be configured properly
  class ConfigurationError < StandardError;end

  # Set global configuration options for blog. {file:README.md read more}
  def self.configure(&block)
    block.call(configuration)
  end

  # blog's global configuration.
  #
  # Returns a Configuration
  def self.configuration
    @configuration ||= Configuration.new
  end

end
