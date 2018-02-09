class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :num_of_questions_asked
      t.integer :num_of_answers

      t.timestamps
    end
  end
end
