class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.text :message, null: false
      t.string :state, null: false, default: 'open'
      t.references :user, foreign_key: true, null: false
      t.integer :closed_by_id
      t.string :subject, null: false

      t.timestamps
    end
  end
end
