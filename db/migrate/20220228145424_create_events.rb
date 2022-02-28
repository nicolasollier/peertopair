class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.string :format
      t.string :event_type
      t.string :venue
      t.string :status

      t.timestamps
    end
  end
end
