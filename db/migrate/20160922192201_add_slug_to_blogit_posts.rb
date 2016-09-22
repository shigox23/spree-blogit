class AddSlugToBlogitPosts < ActiveRecord::Migration
  def change
    add_column :blogit_posts, :slug, :string
  end
end
