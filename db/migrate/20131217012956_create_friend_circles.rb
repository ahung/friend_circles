class CreateFriendCircles < ActiveRecord::Migration
  def change
    create_table :friend_circles do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
    add_index :friend_circles, :user_id
  end
end
