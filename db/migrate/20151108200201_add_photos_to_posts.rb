class AddPhotosToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :photo_url2, :string
    add_column :posts, :photo_url3, :string
    add_column :posts, :photo_url4, :string
    add_column :posts, :photo_url5, :string
  end
end
