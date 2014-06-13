class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :idea, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
