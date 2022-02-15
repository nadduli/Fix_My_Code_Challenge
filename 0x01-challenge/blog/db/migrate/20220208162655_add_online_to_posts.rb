class AddOnlineToPosts < ActiveRecord::Migration[5.0]
  def up
    change_table :posts do |t|
      t.boolean :online, :default => true
    end
    Post.update_all ["online = ?", true]
  end

  def down
    remove_column :posts, :online
  end
end
