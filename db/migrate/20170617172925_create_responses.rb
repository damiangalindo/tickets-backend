class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.references :ticket, foreign_key: true
      t.references :user, foreign_key: true
      t.text :response, null: false

      t.timestamps
    end
  end
end
