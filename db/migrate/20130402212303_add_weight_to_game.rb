class AddWeightToGame < ActiveRecord::Migration
  def change
    add_column :games, :weight, :integer
  end
end
