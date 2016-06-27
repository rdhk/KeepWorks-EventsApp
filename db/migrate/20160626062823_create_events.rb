class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :venue
      t.text :description
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :ticket_price

      t.timestamps null: false
    end
  end
end
