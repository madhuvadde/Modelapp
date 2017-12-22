class RenameNamecolumnToFirstName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :details, :name, :first_name
  end
end
