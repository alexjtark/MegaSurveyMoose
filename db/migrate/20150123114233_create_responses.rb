class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :answer
      t.integer :taker_id
      t.timestamps
    end
  end
end
