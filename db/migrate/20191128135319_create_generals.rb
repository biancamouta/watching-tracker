class CreateGenerals < ActiveRecord::Migration[6.0]
  def change
    create_table :generals do |t|
      t.string :name
      t.bool :status
      t.integer :season
      t.integer :episode
      t.date :next_episode_at

      t.timestamps
    end
  end
end
