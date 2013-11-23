class CreateImages < ActiveRecord::Migration

  def up
    create_table :images do |t|
      t.string :token
      t.string :remote_addr
      t.timestamps
    end
    add_attachment :images, :image
  end

  def down
    drop_table :images
  end

end
