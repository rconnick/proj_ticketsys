require 'spec_helper'

describe TicketController do
  
  before(:each) do
    attr = {:user_id => 1, :service_provider => "sp", :description => "Fix me ticket",
             :opened_at => "open time", :closed_at => "close time"}
    #@ticket = Ticket.new{attr}
    @ticket = Factory(:ticket)
    
  end
  
  describe "ticket action" do    
    it "should find a ticket in Tickets and assign it to @ticket" do      
      Ticket.stub(:find_by_id).with("1").and_return @ticket
      get :ticket, :ticket_id => 1
      assigns[:ticket].should eq(@ticket)
    end
  end
    
  describe "delete action" do    
    it "should delete the ticket matching the id from the database and show the index page" do
      Ticket.should_receive(:delete).with("1")
      delete :delete, :ticket_id => 1
      response.should redirect_to :action => "index"      
    end       
  end
  
  describe "close action" do
    it "should find the ticket matching the ID and update the ticket's closed time" do
      #ticket = Factory(:ticket, :closed_at => "")
      #closed_time = {:closed_at => "current time"}
      #Ticket.stub(:find_by_id).with("1").and_return @ticket
      #Ticket.stub(:update_attritubes!).with(closed_time)
      #get :close, :ticket_id => 1
      #assigns[:ticket].should eq(@ticket)
      #ticket.should_receive(:update_attributes!)
      #Ticket.find_by_id("1").closed_at.should eq("current time")
      #response.should redirect_to :action => "index"      
      Ticket.stub(:find_by_id).with("1").and_return @ticket      
      @ticket.should_receive(:update_attributes!)
      get :close, :ticket_id => 1      
    end   
  end    
  
  describe "open action" do
    it "should find the ticket matching the ID and update the tickets open time" do
      Ticket.stub(:find_by_id).with("1").and_return @ticket      
      @ticket.should_receive(:update_attributes!)
      get :open, :ticket_id => 1      
    end
  end
  
  describe "view users action" do 
    it "should find all the users and assign them to the users variable" do
      users = Factory(:user)      
      User.stub(:where).and_return users      
      get :view_users
      assigns[:all_users].should eq users   
    end
  end
  
  describe "user action" do
    it "should find the user by the passed ID and assign it to the user variable" do
      user = Factory(:user)
      User.stub(:find_by_id).with("1").and_return user
      get :user, :user_id => 1
      assigns[:user].should eq user      
    end    
  end
  
  describe "delete user action" do
    it "should delete the user with the passed ID from the database" do
      User.should_receive(:delete).with "1"
      get :delete_user, :user_id => 1
      response.should redirect_to :action => "view_users"      
    end    
  end
  
  describe "edit user action" do
    it "should find the user by the passed ID and assign it to the user variable" do
      user = Factory(:user)
      User.stub(:find_by_id).with("1").and_return user
      get :user, :user_id => 1
      assigns[:user].should eq user      
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