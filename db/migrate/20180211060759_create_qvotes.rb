class CreateQvotes < ActiveRecord::Migration[5.0]
  def change
    create_table :qvotes do |t|
      t.integer :upvote
      t.belongs_to :user, foreign_key: true
      t.belongs_to :question, foreign_key: true

      t.timestamps
    end
  end
end
