

When /the following tickets exist/ do |tickets_table|
  tickets_table.hashes.each do |ticket|
    Ticket.create!(ticket)    
  end  
end

When /(.*) is logged on as "(.*)"/ do |name, privilege|
  user = User.new(:username => name, :privilege => privilege, :password => "123")
  user.save
  visit path_to "the home page"
  fill_in("Username:", :with => user.username)
  fill_in("Password:", :with => user.password)
  click_button("Login")
  #session[:uid] = user.id
end

When /the user "(.*)" exists with the password "(.*)"/ do |name, password| 
  user = User.new(:username => name, :password => "123")
  user.save
end  
  
#When /I am not logged in/ do  
#end

When /I am logged on as "(.*)"/ do |privilege| 
  user = User.new(:username => privilege, :privilege => privilege, :password => "123")
  user.save
  visit path_to "the home page"
  fill_in("Username:", :with => user.username)
  fill_in("Password:", :with => user.password)
  click_button("Login")
end

When /a ticket with the description "(.*)" exists/ do |des|
  t = Ticket.new(:user_id=> 1, :description => des, :opened_at => "now")
  t.save
end

When /(.*) is logged on/ do |name|
  user = User.new(:username => name, :privilege => admin, :password => "123")
  user.save
  visit path_to "the home page"
  fill_in("Username:", :with => user.username)
  fill_in("Password:", :with => user.password)
  click_button("Login")
end




