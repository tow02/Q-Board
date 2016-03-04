class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.integer :total_vote
      t.boolean :is_accepted

      t.timestamps null: false
    end
  end
end
