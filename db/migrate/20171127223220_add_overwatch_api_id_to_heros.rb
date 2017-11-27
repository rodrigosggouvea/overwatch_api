class AddOverwatchApiIdToHeros < ActiveRecord::Migration[5.1]
  def change
    add_column :heros, :overwatch_api_id, :integer
  end
end
