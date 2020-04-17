class RemoveTopicIdFromQuestions < ActiveRecord::Migration[6.0]
  def change

    remove_column :questions, :topic_id, :integer
  end
end
