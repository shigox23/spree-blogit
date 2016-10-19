class AddDescriptionToPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :description, :text
  end
end
