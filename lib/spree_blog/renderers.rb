module Spreeblog::Renderers
  def self.choose_highlight_renderer
    case Spreeblog::configuration.syntax_highlighter
    when :albino
      require "spree_blog/renderers/html_with_albino"
      Redcarpet::Render::HTMLWithAlbino
    when :pygments
      require "spree_blog/renderers/html_with_pygments"
      Redcarpet::Render::HTMLWithPygments
    else
      raise Spreeblog::ConfigurationError,
        "'#{Spreeblog.configuration.syntax_highlighter}' is not a valid renderer"
    end
  end
end
