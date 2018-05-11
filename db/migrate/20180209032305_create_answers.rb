class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :question, foreign_key: true
      t.integer :vote_score
      t.integer :up_vote
      t.integer :down_vote
      t.string :answer_context
      t.text :answer_body

      t.timestamps
    end
  end
end
