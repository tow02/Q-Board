class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :room_subject, index: true, foreign_key: true
      t.text :title
      t.text :content
      t.integer :total_vote
      t.integer :total_star

      t.timestamps null: false
    end
  end
end
