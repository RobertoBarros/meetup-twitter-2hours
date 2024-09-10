class AddLikesToTwitt < ActiveRecord::Migration[7.2]
  def change
    add_column :twitts, :like, :integer, default: 0
  end
end
