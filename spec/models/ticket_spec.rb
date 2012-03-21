require 'spec_helper'


describe Ticket do
  
  before(:each) do    
    @attr = {:user_id => 1, :service_provider => "sp", :description => "Fix me ticket",
             :opened_at => "open time", :closed_at => "close time"}    
  end
  
  it "should create an new Ticket" do
    Ticket.create!(@attr)
  end  
  
  it "should require a user id" do
    ticket = Ticket.new(@attr.merge(:user_id => nil))
    ticket.should_not be_valid    
  end
  
  it "should require a descrition" do
    ticket = Ticket.new(@attr.merge(:description =>""))
    ticket.should_not be_valid    
  end
  
  it "should require an opened at time" do
    ticket = Ticket.new(@attr.merge(:opened_at =>""))
    ticket.should_not be_valid    
  end
  
end