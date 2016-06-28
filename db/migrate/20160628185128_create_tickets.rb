class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true
      t.integer :ticket_bought_for
      
      t.timestamps null: false
    end
  end
end
