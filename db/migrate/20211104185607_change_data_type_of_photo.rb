class ChangeDataTypeOfPhoto < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :photo, :string
  end
end
