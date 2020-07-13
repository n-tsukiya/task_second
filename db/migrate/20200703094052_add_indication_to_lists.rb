class AddIndicationToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :indication, :integer, default: 0
  end
end
