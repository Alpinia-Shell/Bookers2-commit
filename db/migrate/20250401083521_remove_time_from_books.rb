class RemoveTimeFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :time, :string
  end
end
