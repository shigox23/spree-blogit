Deface::Override.new(
    :virtual_path => 'spree/shared/_main_nav_bar',
    :name => 'add_blog_to_spree_nav',
    :insert_after => '[data-hook="home-link"]',
    :text => '<li id="home-link">
      <%= link_to Spree.t(:blog), spree.blog_path %></li>'
)
