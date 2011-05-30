class CreateMagnetismComments < ActiveRecord::Migration
  def change
    create_table :magnetism_comments do |t|

      t.timestamps
    end
  end
end
