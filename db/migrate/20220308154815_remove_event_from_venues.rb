class RemoveEventFromVenues < ActiveRecord::Migration[6.1]
  def change
    remove_reference :venues, :event, null: false, foreign_key: true
  end
end
