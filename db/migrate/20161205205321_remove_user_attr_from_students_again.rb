class RemoveUserAttrFromStudentsAgain < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :last_name, :string
    remove_column :students, :email, :string
  end
end
