class CreateVenueRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :venue_rankings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.integer :rank
      t.string :place_name

      t.timestamps
    end
  end
end
