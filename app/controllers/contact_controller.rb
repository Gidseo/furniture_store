class ContactController < ApplicationController


  # protect_from_forgery :except => :create

  layout "contact"

  def index
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(params[:visitor])
    if @visitor.save!
      sent = InterestMailer.interest_email(@visitor).deliver
      flash[:notice] = "Thank you, your interest have been registered."
    else
      flash[:notice] = "Unfortunately there were a problem registering your interest, please call the number on the web site. Thank you."
    end
    redirect_to :action => 'index', :protocol => 'http://'
  end

end
