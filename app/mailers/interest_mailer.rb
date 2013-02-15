class InterestMailer < ActionMailer::Base
  default from: "mail@emson.co.uk"

  def interest_email(visitor)
    @visitor = visitor
    mail(:to => 'ben@emson.co.uk', :subject => "Visitor interest notification: #{@visitor.name}")
  end
end
