class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
	  t.string :service_provider
	  t.string :description
	  t.string :closed_at
	  t.string :opened_at
      t.timestamps
    end
  end
end
