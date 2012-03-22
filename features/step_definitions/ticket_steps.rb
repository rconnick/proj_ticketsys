

Given /the following tickets exist/ do |tickets_table|
  tickets_table.hashes.each do |ticket|
    Ticket.create!(ticket)    
  end  
end

Given /(.*) is logged on as "(.*)"/ do |name, privilege|
  user = User.new(:username => name, :privilege => privilege, :password => "123")
  user.save
  visit path_to "the home page"
  fill_in("Username:", :with => user.username)
  fill_in("Password:", :with => user.password)
  click_button("Login")
  #session[:uid] = user.id
end
