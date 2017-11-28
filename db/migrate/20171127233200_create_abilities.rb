class CreateAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :abilities do |t|
      t.references :hero, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :is_ultimate
      t.integer :overwatch_api_id

      t.timestamps
    end
  end
end
