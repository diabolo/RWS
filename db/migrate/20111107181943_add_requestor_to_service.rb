class AddRequestorToService < ActiveRecord::Migration
  def change
    add_column :services, :requestor, :string
  end
end
