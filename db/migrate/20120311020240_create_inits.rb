class CreateInits < ActiveRecord::Migration
  def change
    create_table :inits do |t|
      t.boolean :init
      t.timestamps
    end
	##Initializes init to false for startup
	Init.create :init=>false
  end
end
