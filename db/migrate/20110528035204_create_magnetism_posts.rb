class CreateMagnetismPosts < ActiveRecord::Migration
  def change
    create_table :magnetism_posts do |t|

      t.timestamps
    end
  end
end
