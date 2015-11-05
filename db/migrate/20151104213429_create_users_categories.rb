class CreateUsersCategories < ActiveRecord::Migration
  def change
    create_table :users_categories do |t|
      t.references :user
      t.references :category
    end
  end
end
