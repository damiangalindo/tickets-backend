class CreateReponses < ActiveRecord::Migration[5.1]
  def change
    create_table :reponses do |t|
      t.references :ticket, foreign_key: true
      t.references :user, foreign_key: true
      t.text :response

      t.timestamps
    end
  end
end
