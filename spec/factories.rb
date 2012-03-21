require 'faker'


Factory.define :user do |u|  
  u.username  Faker::Name.name 
  u.password  "12345"
  u.privilege  "admin"  
end


Factory.define :ticket do |t|
  t.user_id  1
  t.service_provider  Faker::Name.name 
  t.description  "I'm a ticket"
  t.closed_at  "close time"
  t.opened_at  "open time" 
end





