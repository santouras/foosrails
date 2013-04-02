class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user1_id, foreign_key: { references: :users }, index: true
      t.integer :user2_id, foreign_key: { references: :users }, index: true
      t.integer :score1
      t.integer :score2
      t.float :points

      t.timestamps
    end
  end
end
