class CreateTopicFolloweds < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_followeds do |t|
      t.integer :user_id
      t.integer :follow_id
      t.integer :question_id

      t.timestamps
    end
  end
end
