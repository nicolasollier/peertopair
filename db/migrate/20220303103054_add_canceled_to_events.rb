class AddCanceledToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :canceled, :boolean
  end
end
