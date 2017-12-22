class AddColumnLastNameToDetail < ActiveRecord::Migration[5.1]
  def change
  	add_column :details, :last_name, :string
  end
end
