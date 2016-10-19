Deface::Override.new(
    :original => 'c3e21218da38ac0db70bb54059726c3fa153c3bd',
    :virtual_path => 'spree/layouts/admin',
    :name => 'add_blog_posts_to_admin_menu',
    :insert_bottom => '[data-hook="admin_tabs"]',
    :text => '<ul class="nav nav-sidebar">
        <%= tab t(:blog_posts, scope: \'blog.posts\'), :url => admin_blog_root_path, :icon => \'bullhorn\' %>
      </ul>'
)
