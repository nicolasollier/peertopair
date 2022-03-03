class AddRankingDoneToUserEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :user_events, :ranking_done, :boolean
  end
end
