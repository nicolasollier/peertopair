class AddNoteToVenueRankings < ActiveRecord::Migration[6.1]
  def change
    add_column :venue_rankings, :note, :float
  end
end
