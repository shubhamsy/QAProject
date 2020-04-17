class RemoveQuestionIdFromTopics < ActiveRecord::Migration[6.0]
  def change

    remove_column :topics, :question_id, :integer
  end
end
