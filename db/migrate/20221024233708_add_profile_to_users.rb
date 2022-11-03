class AddProfileToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bday, :date, default: ""
    add_column :users, :bio, :string, default: ""
    add_column :users, :occupation, :string, default: ""
    add_column :users, :location, :string, default: ""
  end
end
