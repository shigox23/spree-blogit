class CreateblogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.with_options(null: false) do |r|
        r.string :title
        r.text :body
        r.string :state, default: SpreeBlog::configuration.hidden_states.first.to_s
        r.integer :comments_count, default: 0
      end
      t.references :blogger, polymorphic: true
      t.timestamps
    end
    add_index :blog_posts, [:blogger_type, :blogger_id]
  end
end
