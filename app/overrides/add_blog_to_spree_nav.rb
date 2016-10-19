Deface::Override.new(
    :virtual_path => 'spree/shared/_main_nav_bar',
    :name => 'add_blog',
    :insert_after => '#home-link[data-hook]',
    :text => '<li id="home-link">
      <%= link_to Spree.t(:blog), blog_root_path %></li>'
)
