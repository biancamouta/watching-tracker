class AddMyListToGeneral < ActiveRecord::Migration[6.0]
  def change
    add_column :generals, :my_list, :string
  end
end
