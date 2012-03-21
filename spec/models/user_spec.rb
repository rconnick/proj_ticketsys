require 'spec_helper'

describe User do
  
  before(:each) do    
    @attr = {:username => "Josh", :password => "pw", :privilege => "admin"}    
  end
  
  it "should create an new user" do
    User.create!(@attr)
  end
  
  it "should require a username" do
    user = User.new(@attr.merge(:username =>""))
    user.should_not be_valid    
  end
  
  it "should require a password" do
    user = User.new(@attr.merge(:password =>""))
    user.should_not be_valid    
  end
  
  it "should require a privilege" do
    user = User.new(@attr.merge(:privilege =>""))
    user.should_not be_valid    
  end
  
  it "should require that the user name be unique" do
    User.new(@attr).save    
    user = User.new(@attr)     
    user.should_not be_valid     
  end 
  
end

