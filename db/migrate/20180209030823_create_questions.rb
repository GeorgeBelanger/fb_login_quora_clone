class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :vote_score
      t.integer :up_vote
      t.integer :down_vote
      t.integer :num_answers
      t.string :question_title
      t.text :question_body

      t.timestamps
    end
  end
end
