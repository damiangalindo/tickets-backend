class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.text :message
      t.string :status
      t.references :user, foreign_key: true
      t.integer :closed_by_id
      t.string :subject

      t.timestamps
    end
  end
end
