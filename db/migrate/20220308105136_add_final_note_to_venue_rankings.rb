class AddFinalNoteToVenueRankings < ActiveRecord::Migration[6.1]
  def change
    add_column :venue_rankings, :final_note, :float
  end
end
