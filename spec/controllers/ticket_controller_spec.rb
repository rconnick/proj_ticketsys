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
  
  describe 'logging in' do
    it 'should call the User model method to find a user by name' do
      User.should_receive(:find_by_username)
      post :login
    end
    describe 'using an invalid username/password' do
      it 'should redirect to the index with an error' do
        admin = mock('User')
        admin.stub(:password) {'right'}
        User.should_receive(:find_by_username).with('admin').and_return(admin)
        post :login, :username => 'admin', :password => 'wrong'
        response.should redirect_to :action => 'index', :notice => 'Invalid Username/Password'
      end
    end
    describe 'using a valid username/password' do
      it 'should redirect to the index with no error' do
        admin = mock('User')
        admin.stub(:password) {'right'}
        admin.stub(:method_missing)
        User.should_receive(:find_by_username).with('admin').and_return(admin)
        post :login, :username => 'admin', :password => 'right'
        response.should redirect_to :action => 'index', :notice => nil
      end
    end
  end
  describe 'viewing the main page' do
    it 'should call the where method of the Ticket model' do
      Ticket.should_receive(:where).exactly(4).times
      get :index
    end
  end
  
  
end