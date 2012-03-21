require 'spec_helper'

describe TicketController do
  
  before(:each) do    
    attr = {:user_id => 1, :service_provider => "sp", :description => "Fix me ticket",
             :opened_at => "open time", :closed_at => "close time"}    
    #@ticket = Ticket.new{attr}   
    @tic_f = Factory(:ticket) 
    
  end
  
  describe "ticket action" do
    
    it "should find a ticket in Tickets and assign it to @ticket" do
      
      Ticket.stub(:find_by_id).with("1").and_return @tic_f
      get :ticket, :ticket_id => 1
      assigns[:ticket].should eq(@tic_f)     
    end 
    
  end
  
  
end