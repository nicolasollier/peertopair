class DeleteStatusToEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :status 
  end
end