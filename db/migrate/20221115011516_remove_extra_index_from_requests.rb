class RemoveExtraIndexFromRequests < ActiveRecord::Migration[7.0]
  def change
    remove_index :friend_requests, name: "index_friend_requests_on_friend_id"
  end
end
