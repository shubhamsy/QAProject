class AddTopicIdToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :topic_id, :integer
  end
end
