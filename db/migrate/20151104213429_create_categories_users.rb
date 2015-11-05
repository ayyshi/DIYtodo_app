class CreateCategoriesUsers < ActiveRecord::Migration
  def change
    create_table :categories_users do |t|
      t.references :category
      t.references :user
    end
  end
end


# must be in alphabetical order!!!!
