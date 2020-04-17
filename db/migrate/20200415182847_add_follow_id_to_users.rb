class AddFollowIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :follow_id, :integer
  end
end
