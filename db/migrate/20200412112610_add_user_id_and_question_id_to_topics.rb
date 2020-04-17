class AddUserIdAndQuestionIdToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :user_id, :integer
    add_column :topics, :question_id, :integer
  end
end
