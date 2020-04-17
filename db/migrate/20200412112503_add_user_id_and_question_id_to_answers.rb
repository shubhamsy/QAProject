class AddUserIdAndQuestionIdToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :user_id, :integer
    add_column :answers, :question_id, :integer
  end
end
