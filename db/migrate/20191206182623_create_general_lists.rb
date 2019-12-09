class CreateGeneralLists < ActiveRecord::Migration[6.0]
  def change
    create_table :general_lists do |t|
      t.references :general, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
