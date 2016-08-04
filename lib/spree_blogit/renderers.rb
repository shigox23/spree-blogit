module SpreeBlogit::Renderers
  def self.choose_highlight_renderer
    case SpreeBlogit::configuration.syntax_highlighter
    when :albino
      require "spree_blogit/renderers/html_with_albino"
      Redcarpet::Render::HTMLWithAlbino
    when :pygments
      require "spree_blogit/renderers/html_with_pygments"
      Redcarpet::Render::HTMLWithPygments
    else
      raise SpreeBlogit::ConfigurationError,
        "'#{SpreeBlogit.configuration.syntax_highlighter}' is not a valid renderer"
    end
  end
end
