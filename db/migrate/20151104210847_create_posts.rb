class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.date   :goal_date
      t.date   :completed_date

      t.references :user
      t.references :category

      t.timestamps
    end
  end
end
