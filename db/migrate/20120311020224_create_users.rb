class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
	  t.string :password
	  t.string :privilege
      t.timestamps
    end
	## Sets up the admin for default 
	User.create :username => "admin",
			    :password => "password",
			    :privilege => "admin"
  end
end
