class TicketController < ApplicationController
  def index
    ## init? = Init.find_by_id(1)
    ## @init = init?.init
    @init = false
    @all_open_tickets = Ticket.where("closed_at = ?", "")
    @all_closed_tickets = Ticket.where("closed_at != ?", "")
    @my_opened_tickets = Ticket.where("user = ? AND closed_at == ?", 
                                     session[:uname], "")
    @my_closed_tickets = Ticket.where("user = ? AND closed_at != ?", 
                                     session[:uname], "")                               
  end
  
  def login
    if request.post?
      if user = User.find_by_username(params[:username])
        if user.password == params[:password] 
          session[:uid] = user.id
          session[:uname] = user.username
          session[:priv] = user.privilege
          redirect_to :action => "index"
        else
          redirect_to :action => "index", :notice => "Invalid Username/Password"
        end
      else 
        redirect_to :action => "index", :notice => "Invalid Username/Password"
      end
    end
  end
  
  def logout
    session[:uid] = nil
    session[:uname] = nil
    session[:priv] = nil
    redirect_to :action => "index" #redirect to the homepage
  end
  
  def new_ticket
    if request.post?
      ticket = Ticket.new do |t|
        t.user = params[:user]
        t.opened_at = params[:opened_at]
        t.closed_at = params[:closed_at]
        t.service_provider = params[:service_provider]
        t.description = params[:description]
      end
      if ticket.save
        redirect_to :action => "index"
      else
        redirect_to :action => "new_ticket", :notice=>"Incomplete Ticket", 
                    :service_privder => params[:service_provider], 
                    :description => params[:description]
      end
    end 
  end
  
  def my_tickets
    @my_tickets = []
    @my_tickets = Ticket.find_all_by_user(session[:uname])
  end
  
  def ticket ## AKA View Ticket
    @ticket = Ticket.find_by_id(params[:ticket_id])
  end
  
  def delete 
    Ticket.delete(params[:ticket_id])
    redirect_to :action => "index"
  end
  
  def close
    ticket = Ticket.find_by_id(params[:ticket_id])
    ticket.update_attributes!(:closed_at => Time.now())
    redirect_to :action => "index"
  end
  
  def open
    ticket = Ticket.find_by_id(params[:ticket_id])
    ticket.update_attributes!(:closed_at => "")
    redirect_to :action => "index"
  end
  
  def view_users
    @all_users = User.where("username != ?", "")
  end
  
  def add_user
    if request.post?
      user = User.new do |u|
        u.username = params[:username]
        u.password = params[:password]
        u.privilege = params[:privilege]
      end
      if user.save
        redirect_to :action => "view_users"
      else
        redirect_to :action => "add_user", :notice => "Invalid User", 
                    :username => params[:username],
                    :privilege => params[:privilege]
      end
    end
  end
  
  def user
    @user = User.find_by_id(params[:user_id])
  end
  
  def delete_user
    User.delete(params[:user_id])
    redirect_to :action => "view_users"
  end
  
  def edit_user
    @user = User.find_by_id(params[:user_id])
  end
  
  def update_user
    user = User.find_by_id(params[:user_id])
    user.update_attributes(:username => params[:username], 
                           :password => params[:password],
                           :privilege => params[:privilege])
    if user.save
      redirect_to :action => "view_users"
    else
      redirect_to :action => "edit_user",
                  :user_id => user.id
    end
  end
end
