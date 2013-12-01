class AddSessionIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :session_id, :integer
  end
end
